#!/usr/bin/env bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${currentDir}/base.sh # Get variables from base.

# trap any error, and mark it as a system failure.
trap "exit $SYSTEM_FAILURE_EXIT_CODE" ERR

pull_image () {
    # If the image isn't available locally we need to get it.
    if ! udocker inspect "$CUSTOM_ENV_CI_JOB_IMAGE" >/dev/null 2>/dev/null ; then
        echo 'First time using this image, pulling it from dockerhub'
        udocker pull "$CUSTOM_ENV_CI_JOB_IMAGE"
    fi
}

create_container () {
    if udocker inspect "$CONTAINER_ID" >/dev/null 2>/dev/null ; then
        echo 'Found old container, deleting'
        udocker rm -f "$CONTAINER_ID"
    fi

    # Create a container from the image given in .gitlab-ci.yml. This assumes that image is udocker
    # compatible. Many images aren't, but there is no way to check for that.
    udocker create --name="$CONTAINER_ID" "$CUSTOM_ENV_CI_JOB_IMAGE"
}

pull_image

echo "Running in $CONTAINER_ID"

create_container