#!/bin/bash

PACKAGES=${@:-pkg/*}

pushd
CURDIR=$PWD
for package in $PACKAGES; do 
    cd ${CURDIR}/$package
    makepkg
done
cd $CURDIR

#cat >>/etc/pacman.conf <<EOF
#[idursun]
#SigLevel = Optional TrustAll
#Server = $REPO_URL
#EOF


