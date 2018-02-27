#!/bin/bash

VERSION_HASH=$(cat version.txt)
DIR=/var/www/czr/site
HTTPDUSER=$(ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1)
sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var
sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var

cd ..

sudo rm ${DIR}/site-curr
sudo ln -sf ${DIR}/${VERSION_HASH} ${DIR}/site-curr
sudo rm -rf ${DIR}/${VERSION_HASH}.tar.gz