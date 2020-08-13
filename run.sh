#!/usr/bin/env bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${currentDir}/base.sh # Get variables from base.

udocker run --containerauth --nobanner "$CONTAINER_ID" /bin/bash < "${1}"
if [ $? -ne 0 ]; then
    # Mark the build as failure in GitLab CI.
    exit $BUILD_FAILURE_EXIT_CODE
fi