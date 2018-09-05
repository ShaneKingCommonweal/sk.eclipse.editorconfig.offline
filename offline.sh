#!/usr/bin/env bash

[[ -d editorconfig-eclipse ]] && rm -rf editorconfig-eclipse
git clone "https://github.com/ncjones/editorconfig-eclipse.git"
cd editorconfig-eclipse
git submodule init && git submodule update
mvn clean install
cd ../

[[ -d editorconfig-eclipse-offline ]] && rm -rf editorconfig-eclipse-offline
git clone "https://github.com/ShaneKing/editorconfig-eclipse-offline.git"
cp -r editorconfig-eclipse/editorconfig-eclipse-p2 editorconfig-eclipse-offline

cd editorconfig-eclipse-offline
git pull
git add -A
git commit -m "sync at $(date +'%Y-%m-%d %H:%M')"
git push -f "https://ShaneKing:${GH_TOKEN}@github.com/ShaneKing/editorconfig-eclipse-offline.git" master:master

