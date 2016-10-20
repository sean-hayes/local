#!/bin/bash

if [ -z "$1" ]; then
    TESTDIR="./*"
else
    TESTDIR=$1
fi
if [ -z "$2" ]; then
    REPLACEPIC=/home/sean/src/flatsavvy/apps/tasks/test_verification_image.png
else
    REPLACEPIC=$2
fi

IMAGE_RE="/home/herb/.*[.](png|PNG|jpge|jpg|JPG)"

grep -rlE "${IMAGE_RE}" "${TESTDIR}" | xargs sed -r -i'' "s@${IMAGE_RE}@${REPLACEPIC}@g"
