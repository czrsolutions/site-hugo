#!/bin/bash

VERSION_HASH=$(cat version.txt)
DIR=/var/www/czr/site

cd ..
sudo rm ${DIR}/site-curr
sudo ln -sf ${DIR}/${VERSION_HASH} ${DIR}/site-curr
sudo rm -rf ${DIR}/${VERSION_HASH}.tar.gz