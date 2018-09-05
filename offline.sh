#!/usr/bin/env bash

git clone "https://github.com/ncjones/editorconfig-eclipse.git"

cd ncjones/editorconfig-eclipse

mvn clean install

cd ../../

git clone "https://github.com/ShaneKing/editorconfig-eclipse-offline.git"

cp -r ncjones/editorconfig-eclipse/editorconfig-eclipse-p2 ShaneKing/editorconfig-eclipse-offline/editorconfig-eclipse-p2

git -C ./ShaneKing/editorconfig-eclipse-offline pull
git -C ./ShaneKing/editorconfig-eclipse-offline add -A
git -C ./ShaneKing/editorconfig-eclipse-offline commit -m "sync images at $(date +'%Y-%m-%d %H:%M')"
git -C ./ShaneKing/editorconfig-eclipse-offline push -f "https://ShaneKing:${GH_TOKEN}@github.com/ShaneKing/editorconfig-eclipse-offline.git" mirror:mirror

