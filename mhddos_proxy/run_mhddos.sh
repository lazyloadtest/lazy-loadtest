#!/bin/bash
THREADS=$(nproc) ; THREADS=$(expr $THREADS \* 1000)
docker run -d --name mhddos_proxy --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy -t $THREADS --itarmy