#!/bin/bash

echo "[.] =================> CONTAINERS <================"
docker ps -a -q
echo "[.] =================> IMAGES <===================="
docker images -q
echo "[.] =================> NETWORKS <=================="
docker network ls
echo "[.] =================> VOLUMES <==================="
docker volume ls
