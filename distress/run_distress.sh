#!/bin/bash
docker stop distress
docker pull ghcr.io/yneth/distress
docker run -d --name distress --rm ghcr.io/yneth/distress
