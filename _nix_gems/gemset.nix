{
  addressable = {
    dependencies = ["public_suffix"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1by7h2lwziiblizpd5yx87jsq8ppdhzvwf08ga34wzqgcv1nmpvz";
      type = "gem";
    };
    version = "2.9.0";
  };
  afm = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ia5iw9xvvy1igaxsa08vvv4b5ry9ipyr18917pi8w0y4kvddm2v";
      type = "gem";
    };
    version = "1.0.0";
  };
  Ascii85 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmyxpngg5rycyryhq9l9hapz1y3iqyflskyksxkqm0832a5vjqm";
      type = "gem";
    };
    version = "2.0.1";
  };
  asciidoctor = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hbin3j8wynl2fpqa3d6vb932pyngyfn8j2q6gbbn1n23z7srqqn";
      type = "gem";
    };
    version = "2.0.26";
  };
  asciidoctor-diagram = {
    dependencies = ["asciidoctor" "rexml"];
    groups = ["jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "113658j129myfg5y41zf94pkkfy8ysqvxdr2da2gf9x6y98x0cp4";
      type = "gem";
    };
    version = "3.2.1";
  };
  asciidoctor-diagram-batik = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jjrz9pzlckmk8c49zkmymbiwjyc9yn3ngn8gqb2xz8k74ag8vfi";
      type = "gem";
    };
    version = "1.19";
  };
  asciidoctor-diagram-plantuml = {
    dependencies = ["asciidoctor-diagram" "asciidoctor-diagram-batik"];
    groups = ["jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0brwrasp0jsycpfia7n8jslf03csj7nwxr199r2v3f7s5pnhvlq6";
      type = "gem";
    };
    version = "1.2026.2";
  };
  async = {
    dependencies = ["console" "fiber-annotation" "io-event"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02s99xxqgy7arxnfh19irk55is4mr4g4aik36ybsjqxz7mrq9y9l";
      type = "gem";
    };
    version = "2.46.0";
  };
  base64 = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yx9yn47a8lkfcjmigk79fykxvr80r4m1i35q82sxzynpbm7lcr7";
      type = "gem";
    };
    version = "0.3.0";
  };
  benchmark = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0v1337j39w1z7x9zs4q7ag0nfv4vs4xlsjx2la0wpv8s6hig2pa6";
      type = "gem";
    };
    version = "0.5.0";
  };
  bigdecimal = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rng45p4vc3f6nac44cnylwch7rj4zsff3icdz6c7garwpjy3sv1";
      type = "gem";
    };
    version = "4.1.3";
  };
  colorator = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0f7wvpam948cglrciyqd798gdc6z3cfijciavd0dfixgaypmvy72";
      type = "gem";
    };
    version = "1.1.0";
  };
  concurrent-ruby = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qfi2ns3zwkgq616fc127xiqhan7g7m7gqpwriwcr34nds1vxwdj";
      type = "gem";
    };
    version = "1.3.8";
  };
  console = {
    dependencies = ["fiber-annotation" "fiber-local" "json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pnm9bs24jdbhsd8wjif37y8hfcbki9rwbc3dfzfk58f2dcjzf1m";
      type = "gem";
    };
    version = "1.38.0";
  };
  csv = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mj4kq4wwpc7c8ll52q30hsir1jrcd5kq7yb8lyz0rksa1z1x9mb";
      type = "gem";
    };
    version = "3.3.6";
  };
  em-websocket = {
    dependencies = ["eventmachine" "http_parser.rb"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1a66b0kjk6jx7pai9gc7i27zd0a128gy73nmas98gjz6wjyr4spm";
      type = "gem";
    };
    version = "0.5.3";
  };
  ethon = {
    dependencies = ["ffi" "logger"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cpwds6mpija1bwh8p89fqa993llssvi81w5ic3cnj04yg4sz65m";
      type = "gem";
    };
    version = "0.18.0";
  };
  eventmachine = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wh9aqb0skz80fhfn66lbpr4f86ya2z5rx6gm5xlfhd05bj1ch4r";
      type = "gem";
    };
    version = "1.2.7";
  };
  ffi = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kqasqvy8d7r09ri4n6bkdwbk63j7afd9ilsw34nzlgh0qp69ldw";
      type = "gem";
    };
    version = "1.17.4";
  };
  fiber-annotation = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00vcmynyvhny8n4p799rrhcx0m033hivy0s1gn30ix8rs7qsvgvs";
      type = "gem";
    };
    version = "0.2.0";
  };
  fiber-local = {
    dependencies = ["fiber-storage"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01lz929qf3xa90vra1ai1kh059kf2c8xarfy6xbv1f8g457zk1f8";
      type = "gem";
    };
    version = "1.1.0";
  };
  fiber-storage = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qa0j9qjwav9xb0n3isx0rbh0942xrfback392n6vs8bidnmp3pl";
      type = "gem";
    };
    version = "1.0.1";
  };
  forwardable-extended = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15zcqfxfvsnprwm8agia85x64vjzr2w0xn9vxfnxzgcv8s699v0v";
      type = "gem";
    };
    version = "2.6.0";
  };
  google-protobuf = {
    dependencies = ["bigdecimal" "rake"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1514wvzq5nz62khyyi644vbp3yk580lczk8cmcvasjp11bssz39g";
      type = "gem";
    };
    version = "4.36.2";
  };
  hashery = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qj8815bf7q6q7llm5rzdz279gzmpqmqqicxnzv066a020iwqffj";
      type = "gem";
    };
    version = "2.1.2";
  };
  html-proofer = {
    dependencies = ["addressable" "async" "benchmark" "nokogiri" "pdf-reader" "rainbow" "typhoeus" "yell" "zeitwerk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hd20dcjmb36s62jnyidk532bdixs26vmbpzxr334hgrkv466pkf";
      type = "gem";
    };
    version = "5.2.2";
  };
  "http_parser.rb" = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yh924g697spcv4hfigyxgidhyy6a7b9007rnac57airbcadzs4s";
      type = "gem";
    };
    version = "0.8.1";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dfikmmd9dllirsfq0kjiyxpmlq0afkxm5sslsr97r9g85ifpy80";
      type = "gem";
    };
    version = "1.15.2";
  };
  io-event = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "000nbrgd950yx5hjk42lbzbhhcjgq4rg613652wg2aaazv759l0d";
      type = "gem";
    };
    version = "1.22.1";
  };
  jekyll = {
    dependencies = ["addressable" "base64" "colorator" "csv" "em-websocket" "i18n" "jekyll-sass-converter" "jekyll-watch" "json" "kramdown" "kramdown-parser-gfm" "liquid" "mercenary" "pathutil" "rouge" "safe_yaml" "terminal-table" "webrick"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1h8qpki1zcw4srnzmbba2gwajycm50w53kxq8l6vicm5azc484ac";
      type = "gem";
    };
    version = "4.4.1";
  };
  jekyll-asciidoc = {
    dependencies = ["asciidoctor" "jekyll"];
    groups = ["jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mpjgwswyxlxqazv3nsafajxhn6b5mqa2kfnzjr6r1hqg7dgn0mh";
      type = "gem";
    };
    version = "3.0.1";
  };
  jekyll-include-cache = {
    dependencies = ["jekyll"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "188akd1wrwxxm03zddrv3j3z31523jgnhaxnndgh6yy3hx8wfcgy";
      type = "gem";
    };
    version = "0.2.2";
  };
  jekyll-sass-converter = {
    dependencies = ["sass-embedded"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hr4hsir8lm8aw3yj9zi7hx2xs4k00xn9inh24642d6iy625v4l3";
      type = "gem";
    };
    version = "3.1.0";
  };
  jekyll-seo-tag = {
    dependencies = ["jekyll"];
    groups = ["jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lk83j1nmqybq7hmc9girgc3z25jnxswdc6zbhcvzy8xird02q02";
      type = "gem";
    };
    version = "2.9.0";
  };
  jekyll-watch = {
    dependencies = ["listen"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qd7hy1kl87fl7l0frw5qbn22x7ayfzlv9a5ca1m59g0ym1ysi5w";
      type = "gem";
    };
    version = "2.2.1";
  };
  json = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0shwgjqbj856mb6m9kgkpy08nhym2gdvc2yaprlimfmky9y3n78z";
      type = "gem";
    };
    version = "2.21.2";
  };
  just-the-docs = {
    dependencies = ["jekyll" "jekyll-include-cache" "jekyll-seo-tag" "rake"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gjjjnr1y3kzgap21b4gp98gqilfdym7if9k1zb9ha08r6d87whm";
      type = "gem";
    };
    version = "0.12.0";
  };
  kramdown = {
    dependencies = ["rexml"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yh2gwpwhh0p4vc0aabzn0hb55av0wkcq3gh3w8zkdk69hh4598v";
      type = "gem";
    };
    version = "2.5.2";
  };
  kramdown-parser-gfm = {
    dependencies = ["kramdown"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0a8pb3v951f4x7h968rqfsa19c8arz21zw1vaj42jza22rap8fgv";
      type = "gem";
    };
    version = "1.1.0";
  };
  liquid = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1czxv2i1gv3k7hxnrgfjb0z8khz74l4pmfwd70c7kr25l2qypksg";
      type = "gem";
    };
    version = "4.0.4";
  };
  listen = {
    dependencies = ["logger" "rb-fsevent" "rb-inotify"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ln9c0vx165hkfbn2817qw4m6i77xcxh6q0r5v6fqfhlcbdq5qf6";
      type = "gem";
    };
    version = "3.10.0";
  };
  logger = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00q2zznygpbls8asz5knjvvj2brr3ghmqxgr83xnrdj4rk3xwvhr";
      type = "gem";
    };
    version = "1.7.0";
  };
  mercenary = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0f2i827w4lmsizrxixsrv2ssa3gk1b7lmqh8brk8ijmdb551wnmj";
      type = "gem";
    };
    version = "0.4.0";
  };
  mini_portile2 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12f2830x7pq3kj0v8nz0zjvaw02sv01bqs1zwdrc04704kwcgmqc";
      type = "gem";
    };
    version = "2.8.9";
  };
  nokogiri = {
    dependencies = ["mini_portile2" "racc"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d9safb4dly6qmc2g06444l0zifby52yy6j1a5fa1g4j3ihm3jah";
      type = "gem";
    };
    version = "1.19.4";
  };
  pathutil = {
    dependencies = ["forwardable-extended"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12fm93ljw9fbxmv2krki5k5wkvr7560qy8p4spvb9jiiaqv78fz4";
      type = "gem";
    };
    version = "0.16.2";
  };
  pdf-reader = {
    dependencies = ["Ascii85" "afm" "hashery" "ttfunk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cipbx3ssgfsww7hrlll2j27b2vpcwaczqxxg614s9l5q1j5a6xz";
      type = "gem";
    };
    version = "2.16.0";
  };
  public_suffix = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08znfv30pxmdkjyihvbjqbvv874dj3nybmmyscl958dy3f7v12qs";
      type = "gem";
    };
    version = "7.0.5";
  };
  racc = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0byn0c9nkahsl93y9ln5bysq4j31q8xkf2ws42swighxd4lnjzsa";
      type = "gem";
    };
    version = "1.8.1";
  };
  rainbow = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      type = "gem";
    };
    version = "3.1.1";
  };
  rake = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "009p524zl0p0kfa65nii8wdmaigkmawv9pbvlcffky7islmmp0nb";
      type = "gem";
    };
    version = "13.4.2";
  };
  rb-fsevent = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zmf31rnpm8553lqwibvv3kkx0v7majm1f341xbxc0bk5sbhp423";
      type = "gem";
    };
    version = "0.11.2";
  };
  rb-inotify = {
    dependencies = ["ffi"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vmy8xgahixcz6hzwy4zdcyn2y6d6ri8dqv5xccgzc1r292019x0";
      type = "gem";
    };
    version = "0.11.1";
  };
  rexml = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hninnbvqd2pn40h863lbrn9p11gvdxp928izkag5ysx8b1s5q0r";
      type = "gem";
    };
    version = "3.4.4";
  };
  rouge = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fd77qcz603mli4lyi97cjzkv02hsfk60m495qv5qcn02mkqk9fv";
      type = "gem";
    };
    version = "4.7.0";
  };
  safe_yaml = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0j7qv63p0vqcd838i2iy2f76c3dgwzkiz1d1xkg7n0pbnxj2vb56";
      type = "gem";
    };
    version = "1.0.5";
  };
  sass-embedded = {
    dependencies = ["google-protobuf" "rake"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pzzcbp7lnxc4lm40i8mq8r2k83kx5pjmyh8r17rfpaf6kglcbrj";
      type = "gem";
    };
    version = "1.105.0";
  };
  terminal-table = {
    dependencies = ["unicode-display_width"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14dfmfjppmng5hwj7c5ka6qdapawm3h6k9lhn8zj001ybypvclgr";
      type = "gem";
    };
    version = "3.0.2";
  };
  ttfunk = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15iaxz9iak5643bq2bc0jkbjv8w2zn649lxgvh5wg48q9d4blw13";
      type = "gem";
    };
    version = "1.7.0";
  };
  typhoeus = {
    dependencies = ["ethon"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "079k9j2alxxqn8r3vfm1anwp16v9s5f27p01k3i4g59p7v143k5s";
      type = "gem";
    };
    version = "1.6.0";
  };
  unicode-display_width = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nkz7fadlrdbkf37m0x7sw8bnz8r355q3vwcfb9f9md6pds9h9qj";
      type = "gem";
    };
    version = "2.6.0";
  };
  webrick = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ca1hr2rxrfw7s613rp4r4bxb454i3ylzniv9b9gxpklqigs3d5y";
      type = "gem";
    };
    version = "1.9.2";
  };
  yell = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1g16kcdhdfvczn7x81jiq6afg3bdxmb73skqjyjlkp5nqcy6y5hx";
      type = "gem";
    };
    version = "2.2.2";
  };
  zeitwerk = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rcjpgyzmdxp8rdw466156fmr588k9q1wg8j42g0dkk7hid1519c";
      type = "gem";
    };
    version = "2.8.3";
  };
}
