# Build the site and check its links with html-proofer.
#
#   bundle exec rake                 build, then check internal links
#   bundle exec rake build           build only
#   bundle exec rake check           check internal links in _site
#   bundle exec rake check:external  also check links to other sites

require "html-proofer"

SITE_DIR = "_site"

# Options shared by both checks. Links to the site's own domain are
# rewritten to local paths so they are checked against _site, not the
# published site.
PROOFER_OPTIONS = {
  enforce_https: false,
  swap_urls: { %r{\Ahttps://docs\.p2poolv2\.org} => "" },
}.freeze

desc "Build the site into #{SITE_DIR}"
task :build do
  sh "bundle exec jekyll build"
end

desc "Check internal links, anchors and images in #{SITE_DIR}"
task check: :build do
  HTMLProofer.check_directory(SITE_DIR, PROOFER_OPTIONS.merge(disable_external: true)).run
end

namespace :check do
  desc "Check internal and external links in #{SITE_DIR}"
  task external: :build do
    HTMLProofer.check_directory(SITE_DIR, PROOFER_OPTIONS).run
  end
end

task default: :check
