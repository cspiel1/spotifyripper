#!/bin/bash

string="$1"
curl -s -o tmp.html "$string"

# Echo out track number
grep -o -E "music:album:track\" content=\"[0-9]+\"" tmp.html | \
  grep -o -E "[0-9]*"

string=$( grep -Eo "background-image:url\([^\)]*\)" tmp.html | \
  grep -Eo "//[^\)]*" )

curl -s -o cover.jpg "https:$string"

rm -f tmp.html
