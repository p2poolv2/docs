{
  description = "docs.p2poolv2.org: Jekyll, AsciiDoc and PlantUML on Ruby";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});

      common =
        pkgs:
        rec {
          ruby = pkgs.ruby_3_4;

          # The repository's Gemfile, locked for the plain "ruby" platform in
          # _nix_gems/Gemfile.lock and hashed in _nix_gems/gemset.nix. Regenerate both with
          # `nix run .#update-gemset`.
          gems = pkgs.bundlerEnv {
            name = "p2poolv2-docs-gems";
            inherit ruby;
            gemfile = ./Gemfile;
            lockfile = ./_nix_gems/Gemfile.lock;
            gemset = ./_nix_gems/gemset.nix;
            # bundlerEnv includes only "default" unless told otherwise.
            groups = [
              "default"
              "jekyll_plugins"
            ];
          };

          jdk = pkgs.jdk25; # PlantUML runs on the JVM

          tools = [
            gems
            gems.wrappedRuby
            jdk
            pkgs.graphviz # `dot`, for class, component and activity diagrams
          ];

          # Environment shared by the dev shell and the sandboxed builds.
          env = {
            JAVA_HOME = jdk.home;
            GRAPHVIZ_DOT = "${pkgs.graphviz}/bin/dot";
            # _plantuml/p2poolv2.config asks for DejaVu Sans and DejaVu Sans Mono.
            FONTCONFIG_FILE = "${pkgs.makeFontsConf { fontDirectories = [ pkgs.dejavu_fonts ]; }}";
          };

          mkSiteDerivation =
            args:
            pkgs.stdenvNoCC.mkDerivation (
              env
              // {
                version = self.shortRev or self.dirtyShortRev or "dev";
                src = self;
                nativeBuildInputs = tools;
                LANG = "C.UTF-8";
                LC_ALL = "C.UTF-8";
                preBuild = ''
                  export HOME="$TMPDIR"
                '';
              }
              // args
            );
        };
    in
    {
      devShells = forAllSystems (
        pkgs:
        let
          c = common pkgs;
        in
        {
          # nix develop, then: jekyll serve --livereload, or: rake
          default = pkgs.mkShell (c.env // {
           packages = c.tools;
           shellHook = ''
             echo "=== P2Poolv2 docs Nix devShell ==="
             echo ""
             echo "Available commands:"
             echo "  jekyll build                  - Build the site to _site/"
             echo "  jekyll serve --livereload     - Serve at http://localhost:4000 with auto-reload on changes"
             echo ""
             echo "Nix Commands (devShell not required):"
             echo "  nix build                     - Build production site in ./result"
             echo "  nix flake check               - Runs the Rakefile’s internal link check"
             echo "  nix run .#update-gemset       - Regenerates _nix_gems/Gemfile.lock (for Ruby) and _nix_gems/gemset.nix (for Nix)"
             echo "  jwebserver -d result -p 4000  - Serve Nix ./result at http://localhost:4000"
           '';
            }
           );
        }
      );

      packages = forAllSystems (
        pkgs:
        let
          c = common pkgs;
        in
        {
          # nix build  ->  ./result is the built _site
          default = c.mkSiteDerivation {
            pname = "p2poolv2-docs";
            JEKYLL_ENV = "production";
            buildPhase = ''
              runHook preBuild
              jekyll build
              runHook postBuild
            '';
            installPhase = ''
              cp -r _site "$out"
            '';
          };
        }
      );

      checks = forAllSystems (
        pkgs:
        let
          c = common pkgs;
        in
        {
          # nix flake check  ->  the Rakefile's internal link check
          links = c.mkSiteDerivation {
            pname = "p2poolv2-docs-links";
            buildPhase = ''
              runHook preBuild
              rake check
              runHook postBuild
            '';
            installPhase = ''
              touch "$out"
            '';
          };
        }
      );

      apps = forAllSystems (
        pkgs:
        let
          c = common pkgs;
          update-gemset = pkgs.writeShellApplication {
            name = "update-gemset";
            runtimeInputs = [
              c.ruby
              pkgs.bundix
            ];
            text = ''
              if [[ ! -f Gemfile.lock || ! -f _config.yml ]]; then
                echo "update-gemset: run this from the root of the docs repository" >&2
                exit 1
              fi

              # Start from the repository's lockfile so Nix gets the same versions.
              mkdir -p _nix_gems
              cp Gemfile.lock _nix_gems/Gemfile.lock
              chmod u+w _nix_gems/Gemfile.lock
              # Drop BUNDLED WITH so this Bundler doesn't try to switch versions;
              # `bundle lock` writes its own.
              sed -i.bak '/^BUNDLED WITH$/,$d' _nix_gems/Gemfile.lock && rm _nix_gems/Gemfile.lock.bak

              export BUNDLE_GEMFILE="$PWD/Gemfile"
              # Nix builds gems from source, so keep only the generic "ruby"
              # variants. The prebuilt sass-embedded, nokogiri, ffi and
              # google-protobuf gems don't run on NixOS.
              export BUNDLE_FORCE_RUBY_PLATFORM=true
              mapfile -t extra < <(ruby -rbundler -e '
                lock = Bundler::LockfileParser.new(File.read("_nix_gems/Gemfile.lock"))
                puts lock.platforms.map(&:to_s) - ["ruby"]')
              if (( ''${#extra[@]} )); then
                bundle lock --lockfile=_nix_gems/Gemfile.lock --remove-platform "''${extra[@]}"
              fi
              ruby -rbundler -e '
                lock = Bundler::LockfileParser.new(File.read("_nix_gems/Gemfile.lock"))
                platforms = lock.platforms.map(&:to_s)
                abort "_nix_gems/Gemfile.lock still lists #{platforms.join(", ")}" unless platforms == ["ruby"]'

              bundix --gemfile=Gemfile --lockfile=_nix_gems/Gemfile.lock --gemset=_nix_gems/gemset.nix

              echo "Updated _nix_gems/Gemfile.lock and _nix_gems/gemset.nix. Stage them with: git add nix"
            '';
          };
        in
        {
          update-gemset = {
            type = "app";
            program = "${update-gemset}/bin/update-gemset";
          };
        }
      );
    };
}
