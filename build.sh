#!/bin/bash

PACKAGES=${@:-pkg/*}
REPO_NAME=idursun
export PKGDEST="${PWD}/output"

echo "output to $PKGDEST"
for package in $PACKAGES; do (
    cd "$package" || ( echo "No such directory: $package"; exit 1 )
    rm -f ./*.pkg.tar.xz
    makepkg -d
) done

PACKAGES=$(find output/*.pkg.tar.xz)
mkdir database
repo-add database/idursun.db.tar.gz ${PACKAGES}
