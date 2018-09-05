#!/usr/bin/env bash

git clone "https://github.com/ncjones/editorconfig-eclipse.git"

cd editorconfig-eclipse

mvn clean install

cd ../../

git clone "https://github.com/ShaneKing/editorconfig-eclipse-offline.git"

cp -r editorconfig-eclipse/editorconfig-eclipse-p2 editorconfig-eclipse-offline/editorconfig-eclipse-p2

git -C ./editorconfig-eclipse-offline pull
git -C ./editorconfig-eclipse-offline add -A
git -C ./editorconfig-eclipse-offline commit -m "sync images at $(date +'%Y-%m-%d %H:%M')"
git -C ./editorconfig-eclipse-offline push -f "https://ShaneKing:${GH_TOKEN}@github.com/ShaneKing/editorconfig-eclipse-offline.git" master:master

