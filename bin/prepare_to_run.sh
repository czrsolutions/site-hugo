#!/bin/bash

VERSION_HASH=$(cat version.txt)
DIR=/home/deploy/projects/czr-site

cd ..
rm ${DIR}/site-curr
ln -sf ${DIR}/${VERSION_HASH} ${DIR}/site-curr
rm -rf ${DIR}/${VERSION_HASH}.tar.gz