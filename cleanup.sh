#!/usr/bin/env bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${currentDir}/base.sh # Get variables from base.

echo "Deleting container $CONTAINER_ID"

udocker rm -f "$CONTAINER_ID"