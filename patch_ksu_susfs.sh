#!/bin/sh

set -e
set -x

echo "# patch kernel..."
git add . && git reset --hard
yes | cp -rfv susfs4ksu/kernel_patches/fs ./
yes | cp -rfv susfs4ksu/kernel_patches/include/linux/* ./include/linux
patch -p1 < susfs4ksu/kernel_patches/50_add_susfs_in_kernel-4.19.patch

echo "# patch ksu..."
cd KernelSU
git add . && git reset --hard
patch -p1 < ../KernelSU_susfs_1.5.3.patch

echo "# done!"