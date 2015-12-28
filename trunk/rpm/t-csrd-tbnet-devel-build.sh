#!/bin/bash
##for check
export temppath=$1
#export TBLIB_ROOT=/opt/csr/common
cd $temppath/rpm
if [ `cat /etc/redhat-release|cut -d " " -f 7|cut -d "." -f 1` = 4 ]
then
        sed -i  "s/^Release:.*$/Release: "$4".el4/" $2.spec
else
        sed -i  "s/^Release:.*$/Release: "$4".el5/" $2.spec
fi
sed -i  "s/^Version:.*$/Version: "$3"/" $2.spec

/usr/local/bin/rpm_create -p /opt/csr/common -v $3 -r $4 $2.spec -k
mv `find . -name $2-$3-$4*rpm`  .
