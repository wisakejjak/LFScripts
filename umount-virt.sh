#!/bin/bash

function umounts
{
    if mountpoint $LFS/$1 >/dev/null; then
        $SUDO umount $LFS/$1
        echo $LFS/$1 unmounted
    else
        echo $LFS/$1 is not mounted
    fi
}

if [ $EUID -ne 0 ]; then
    SUDO=sudo
else
    SUDO=""
fi

if [ x$LFS == x ]; then
    echo "LFS not set"
    exit 1
fi

umounts dev/pts
umounts proc
umounts sys
umounts run
umounts dev/shm
