#!/bin/sh
if [[ -z "$VER" ]] ; then
	echo set VER!
	exit
fi
me=`pwd`

proj=gnu-getopt
projver=${proj}-${VER}

tempdir=/tmp/${proj}-0000
rm -rf $tempdir
mkdir -p $tempdir

cd $tempdir
git clone http://github.com/rofl0r/$proj $projver
rm -rf $projver/.git

tar cjf $proj.tar.bz2 $projver/
mv $proj.tar.bz2 $me/$projver.tar.bz2
