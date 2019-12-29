#!/bin/bash

PACKAGES=${@:-pkg/*}

LOCAL_PATH=$HOME/.local/share/arch-repo
CHROOT="$HOME/.local/share/arch-root"
REPO_NAME=idursun

mkdir -p "$LOCAL_PATH"
mkdir -p "$CHROOT"

[[ -d "$CHROOT/root" ]] || mkarchroot -C /etc/pacman.conf "$CHROOT/root" \
    bash bzip2 coreutils cryptsetup device-mapper dhcpcd diffutils e2fsprogs \
    file filesystem findutils gawk gcc-libs gettext glibc grep gzip inetutils \
    iproute2 iputils less licenses linux logrotate man-db man-pages mdadm \
    pacman pciutils perl procps-ng psmisc s-nail sed shadow sysfsutils \
    systemd-sysvcompat tar texinfo usbutils util-linux which base-devel

for package in $PACKAGES; do (
    cd "$package" || ( echo "No such directory: $package"; exit 1 )
    rm -f ./*.pkg.tar.xz
    makechrootpkg -cur "$CHROOT"
) done

#CURDIR=$PWD
#for package in $PACKAGES; do 
#    cd ${CURDIR}/$package
#    makepkg -s
#done
#
#cd $CURDIR

#cat >>/etc/pacman.conf <<EOF
#[idursun]
#SigLevel = Optional TrustAll
#Server = $REPO_URL
#EOF


