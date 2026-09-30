#!/usr/bin/env bash
# Build a reveal.js deck from a presentation folder.
#
#   ./build.sh 2026-btcpp-berlin-payments
#
# The deck is written to build/<name>/ with reveal.js, the brand theme,
# and the fonts copied alongside it, so the folder runs offline.
set -euo pipefail

# asciidoctor-revealjs 5.x targets reveal.js 4.
REVEAL_VERSION="4.6.1"

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root="$(cd "${here}/.." && pwd)"

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <presentation-folder>" >&2
  exit 1
fi

name="${1%/}"
source_file="${here}/${name}/slides.adoc"
if [[ ! -f "${source_file}" ]]; then
  echo "no slides.adoc in ${here}/${name}" >&2
  exit 1
fi

# Download reveal.js once and reuse it for every build.
reveal_dir="${here}/.cache/reveal.js-${REVEAL_VERSION}"
if [[ ! -d "${reveal_dir}" ]]; then
  mkdir -p "${here}/.cache"
  curl -fsSL "https://github.com/hakimel/reveal.js/archive/refs/tags/${REVEAL_VERSION}.tar.gz" \
    | tar -xz -C "${here}/.cache"
fi

out="${here}/build/${name}"
rm -rf "${out}"
mkdir -p "${out}/reveal.js" "${out}/css" "${out}/fonts"

cp -R "${reveal_dir}/dist" "${reveal_dir}/plugin" "${out}/reveal.js/"
cp "${here}/theme/p2poolv2.css" "${root}/assets/css/fonts.css" "${out}/css/"
cp "${root}"/assets/fonts/*.woff2 "${root}"/assets/fonts/OFL-*.txt "${out}/fonts/"

cd "${here}"
BUNDLE_GEMFILE="${here}/Gemfile" bundle exec asciidoctor-revealjs \
  -r asciidoctor-diagram \
  -a revealjsdir=reveal.js \
  -a customcss=css/p2poolv2.css \
  -a plantumlconfig="${root}/_plantuml/p2poolv2.config" \
  -a diagram-cachedir="${here}/.cache/diagram" \
  -D "${out}" \
  -o index.html \
  "${source_file}"

echo "Built ${out}/index.html"
