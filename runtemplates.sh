#!/bin/sh
domainname=whitbygroup.com

#Put all files in templating/ 
#into the #main div in the published html file.

for file in publish/*.html; do
  sed "/<div id=main role=main>/r $file" publish/index.html > publish/$basename.html
  sed -i "s/{{domainname}}/$domainname/g" publish/*.html
done
