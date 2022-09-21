#! /usr/bin/env bash

sitemap="docs/sitemap.xml"
baseurl="https://https://defending1.github.io"
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

function s_url() {
  echo "<url><loc>${baseurl}/$1<loc><lastmod>$timestamp</lastmod></url>"
}

robots=`cat <<EOF
User-agent: *
Allow: *
Sitemap: $baseurl/sitemap.xml
EOF
`
echo "$robots" > docs/robots.txt

header=`cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
EOF
` 
echo "$header" > $sitemap

for file in $(find docs -name "*.html" | sed -e 's/docs\///'); do
  echo $(s_url $file) >> $sitemap
done

printf "</urlset>\n" >> $sitemap
