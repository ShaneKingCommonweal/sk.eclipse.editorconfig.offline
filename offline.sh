#!/usr/bin/env bash

[[ -d editorconfig-eclipse ]] && rm -rf editorconfig-eclipse
git clone "https://github.com/ncjones/editorconfig-eclipse.git"
cd editorconfig-eclipse
git submodule init && git submodule update
mvn clean install
cd ../

[[ -d sh.eclipse.editorconfig.offline ]] && rm -rf sh.eclipse.editorconfig.offline
git clone "https://github.com/ShaneKing/sh.eclipse.editorconfig.offline.git"
rm -rf sh.eclipse.editorconfig.offline/editorconfig-eclipse-p2
cp -r editorconfig-eclipse/editorconfig-eclipse-p2 sh.eclipse.editorconfig.offline

cd sh.eclipse.editorconfig.offline
git pull
#can not add target...
#git add -A
git add -f .
git add -u
git commit -m "sync at $(date +'%Y-%m-%d %H:%M')"
git push -f "https://ShaneKing:${GH_TOKEN}@github.com/ShaneKing/sh.eclipse.editorconfig.offline.git" master:master

