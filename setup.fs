#!/bin/bash

if [ -z "$1" ]
then
    ROOTDIR=~
else
    ROOTDIR=$1
fi

# /user/
#   /bin/ - installed toolsl binaries
#   /dev/ - development tree
#   /tmp/ - user temp dir
mkdir -p $ROOTDIR/{bin,dev,tmp}
mkdir -p $ROOTDIR/dev/{conf,data,env,src,utilities,web}
mkdir -p $ROOTDIR/dev/lib/{R,python}

#change ACL's
chown -R $USER:$(grep -q "^admin:" /etc/group && echo "admin" || echo "root") $ROOTDIR/{bin,dev,tmp}

chmod -R 755 $ROOTDIR/bin
chmod -R 755 $ROOTDIR/{dev,tmp}
chmod -R 700 $ROOTDIR/dev/conf

