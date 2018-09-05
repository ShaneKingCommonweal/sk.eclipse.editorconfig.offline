#!/usr/bin/env bash

[[ -d editorconfig-eclipse-offline ]] && rm -rf editorconfig-eclipse-offline
git clone "https://github.com/ncjones/editorconfig-eclipse.git"
cd editorconfig-eclipse
git submodule init && git submodule update
mvn clean install
pwd
ls -alh editorconfig-eclipse-p2
cd ../

[[ -d editorconfig-eclipse-offline ]] && rm -rf editorconfig-eclipse-offline
git clone "https://github.com/ShaneKing/editorconfig-eclipse-offline.git"
cp -r editorconfig-eclipse/editorconfig-eclipse-p2 editorconfig-eclipse-offline/editorconfig-eclipse-p2
pwd
ls -alh editorconfig-eclipse-offline/editorconfig-eclipse-p2

git -C editorconfig-eclipse-offline pull
git -C editorconfig-eclipse-offline add -A
git -C editorconfig-eclipse-offline commit -m "sync at $(date +'%Y-%m-%d %H:%M')"
git -C editorconfig-eclipse-offline push -f "https://ShaneKing:${GH_TOKEN}@github.com/ShaneKing/editorconfig-eclipse-offline.git" master:master

