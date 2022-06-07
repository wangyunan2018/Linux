#!/bin/bash

docker load -i goharbor-chartmuseum-photon090-183.tar
sleep 2
docker load -i goharbor-harbor-migrator183.tar
sleep 2
docker load -i goharbor-redis-photon-183.tar
sleep 2
docker load -i goharbor-clair-photon208-183.tar
sleep 2
docker load -i goharbor-notary-server-photon-061-183.tar
sleep 2
docker load -i goharbor-notary-signer-photon-061-183.tar
sleep 2
docker load -i goharbor-harbor-registryctl-183.tar
sleep 2
docker load -i goharbor-registry-photon-271-183.tar
sleep 2
docker load -i goharbor-nginx-photon183.tar
sleep 2
docker load -i goharbor-harbor-log183.tar
sleep 2
docker load -i goharbor-harbor-jobservice183.tar
sleep 2
docker load -i goharbor-harbor-core183.tar
sleep 2
docker load -i goharbor-harbor-portal183.tar
sleep 2
docker load -i goharbor-harbor-db183.tar
sleep 2
docker load -i goharbor-prepare183.tar