#!/bin/bash

sudo rm -rf build
hugo -d ./build

VERSION_HASH=$(git rev-parse HEAD)
USER=ubuntu
HOST=czr-server.brazilsouth.cloudapp.azure.com
DIR=/var/www/czr/site

git rev-parse HEAD > version.txt
cp -R bin build/bin
cp -R version.txt build/version.txt
cd build
tar -zcvf ./$VERSION_HASH.tar.gz --exclude .git --exclude "*.log" . &> /dev/null
cd ..
bzip2  --best ./build/$VERSION_HASH.tar.gz

scp  ./build/$VERSION_HASH.tar.gz.bz2 $USER@$HOST:$DIR

ssh  $USER@$HOST  "bzip2 -df ${DIR}/${VERSION_HASH}.tar.gz.bz2 && \\
                  sudo rm -rf ${DIR}/${VERSION_HASH} && \\
                  mkdir ${DIR}/${VERSION_HASH} && \\
                  tar -zxf ${DIR}/${VERSION_HASH}.tar.gz -C ${DIR}/${VERSION_HASH} && \\
                  cd ${DIR}/${VERSION_HASH} && sudo bash ./bin/prepare_to_run.sh"
									