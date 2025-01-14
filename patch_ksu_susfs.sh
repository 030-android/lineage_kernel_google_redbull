#!/bin/sh

set -e
set -x

yes | cp -rfv susfs4ksu/kernel_patches/fs ./
yes | cp -rfv susfs4ksu/kernel_patches/include/linux/* ./include/linux
patch -p1 < susfs4ksu/kernel_patches/50_add_susfs_in_kernel-4.19.patch

cd KernelSU
patch -p1 < ../KernelSU_susfs_1.5.3.patch
