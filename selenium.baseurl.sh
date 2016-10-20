#!/bin/bash

if [ -z "$1" ]; then
    TESTDIR="./*"
else
    TESTDIR=$1
fi
if [ -z "$2" ]; then
    REPLACEURL="https://flatsavvy.dsilabs.ca"
else
    REPLACEURL=$2
fi

BASEURL_RE='<link rel="selenium.base".*(/>)'

grep -rlE "${BASEURL_RE}" "${TESTDIR}" | xargs sed -r -i'' "s@${BASEURL_RE}@<link rel=\"selenium.base\" href=\"${REPLACEURL}\" />@g"
