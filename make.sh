#!/bin/sh
domainname=whitbygroup.com
 
#Ant build script
cd build
ant
cd -

#Put all files in templating/ 
#into the #main div in the published html file.

mv publish/index.html base.html
for file in templates/*.html; do
  basename="`basename \"$file\" .html`"
  sed "/<article class=pagespecific>/r $file" base.html > publish/$basename.html
  sed -i "s/{{domainname}}/$domainname/g" publish/*.html
done
rm base.html

scp -r publish/.htaccess publish/* www-data@thomaslevine.com:/srv/www/whitbygroup
