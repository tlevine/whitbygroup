#!/bin/sh
for file in templating/*.html; do
  basename="`basename \"$file\" '.html'`"
  if [ "$basename" = base ]; then
    sed "/<!--Page-specific content below-->/r $file" templating/base.html > $basename.html
  fi
done
