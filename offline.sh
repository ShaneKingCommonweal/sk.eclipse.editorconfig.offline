#!/usr/bin/env bash

pwd
ls -alh $(dirname $0)
git clone "https://github.com/ncjones/editorconfig-eclipse.git"

cd editorconfig-eclipse

git submodule init && git submodule update

mvn clean install

pwd
ls -alh $(dirname $0)
cd ../

[[ -d editorconfig-eclipse-offline ]] && rm -rf ./editorconfig-eclipse-offline


pwd
ls -alh $(dirname $0)
git clone "https://github.com/ShaneKing/editorconfig-eclipse-offline.git"

cp -r editorconfig-eclipse/editorconfig-eclipse-p2 editorconfig-eclipse-offline/editorconfig-eclipse-p2

pwd
ls -alh $(dirname $0)
ls -alh $(dirname $0)/editorconfig-eclipse-offline
ls -alh $(dirname $0)/editorconfig-eclipse-offline/editorconfig-eclipse-p2

git -C $(dirname $0)/editorconfig-eclipse-offline pull
git -C $(dirname $0)/editorconfig-eclipse-offline add -A
git -C $(dirname $0)/editorconfig-eclipse-offline commit -m "sync at $(date +'%Y-%m-%d %H:%M')"
git -C $(dirname $0)/editorconfig-eclipse-offline push -f "https://ShaneKing:${GH_TOKEN}@github.com/ShaneKing/editorconfig-eclipse-offline.git"

