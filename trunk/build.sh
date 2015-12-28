#!/bin/bash

if [ -z $TBLIB_ROOT ]; then
    echo "TBLIB_ROOT has not set"
    exit;
fi

REAL_FILE=`readlink -f $0`
cd `dirname $REAL_FILE`
BASE_HOME="`pwd`"

cd $BASE_HOME/tbsys
if [ -z "$1" -o "$1" = 'make' ]; then  
	sh autogen.sh
	CXXFLAGS='-O3 -Wall -D_NO_EXCEPTION' ./configure
	make -j 8
fi
if [ -z "$1" -o "$1" = 'make' -o "$1" = 'install' ]; then 
	make install
fi

if [ "$1" = 'clean' ]; then
	make clean distclean
	sh autogen.sh clean
fi

cd $BASE_HOME/tbnet 
if [ -z "$1" -o "$1" = 'make' ]; then  
	sh autogen.sh
	./configure
	make -j 8
fi
if [ -z "$1" -o "$1" = 'install' ]; then 
	make install
fi
if [ "$1" = 'clean' ]; then
	make clean distclean
	sh autogen.sh clean
fi

echo "have installed in $TBLIB_ROOT"
