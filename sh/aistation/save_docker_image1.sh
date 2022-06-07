#!/bin/bash

docker save goharbor/chartmuseum-photon:v0.9.0-v1.8.3 -o ./goharbor-chartmuseum-photon090-183.tar
sleep 2

docker save goharbor/harbor-migrator:v1.8.3 -o goharbor-harbor-migrator183.tar
sleep 2

docker save goharbor/redis-photon:v1.8.3 -o goharbor-redis-photon-183.tar
sleep 2

docker save goharbor/clair-photon:v2.0.8-v1.8.3 -o goharbor-clair-photon208-183.tar
sleep 2

docker save goharbor/notary-server-photon:v0.6.1-v1.8.3 -o goharbor-notary-server-photon-061-183.tar
sleep 2

docker save goharbor/notary-signer-photon:v0.6.1-v1.8.3 -o goharbor-notary-signer-photon-061-183.tar
sleep 2

docker save goharbor/harbor-registryctl:v1.8.3 -o goharbor-harbor-registryctl-183.tar
sleep 2

docker save goharbor/registry-photon:v2.7.1-patch-2819-v1.8.3 -o goharbor-registry-photon-271-183.tar
sleep 2

docker save goharbor/nginx-photon:v1.8.3 -o goharbor-nginx-photon183.tar
sleep 2

docker save goharbor/harbor-log:v1.8.3 -o goharbor-harbor-log183.tar
sleep 2

docker save goharbor/harbor-jobservice:v1.8.3 -o goharbor-harbor-jobservice183.tar
sleep 2

docker save goharbor/harbor-core:v1.8.3 -o goharbor-harbor-core183.tar
sleep 2

docker save goharbor/harbor-portal:v1.8.3 -o goharbor-harbor-portal183.tar
sleep 2

docker save goharbor/harbor-db:v1.8.3 -o goharbor-harbor-db183.tar
sleep 2

docker save goharbor/prepare:v1.8.3 -o goharbor-prepare183.tar