#!/bin/bash

docker pull quay.io/minio/minio
docker tag quay.io/minio/minio:latest minio:latest
docker run -dt                                  \
  -p 9000:9000 -p 9090:9090                     \
  -v PATH:/mnt/data                             \
  -v /etc/default/minio:/etc/config.env         \
  -e "MINIO_CONFIG_ENV_FILE=/etc/config.env"    \
  -e "MINIO_ROOT_USER=admin"                    \
  -e "MINIO_ROOT_PASSWORD=admin"                \
  -e "MINIO_VOLUMES=/mnt/data"                  \
  --name "minio_local_1"                          \
  minio server --console-address ":9090"
astro dev start -n