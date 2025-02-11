#!/usr/bin/env bash

export ROOT=/usr/src/kwort/docker
mkdir -p ${ROOT}
export KPKG_DB_HOME=${ROOT}/var/packages/installed.kdb
mkdir -p $(dirname $KPKG_DB_HOME)
cp ${ROOT}/../iso/packages/installed.kdb "${KPKG_DB_HOME}"
kpkg install \
   ${ROOT}/../iso/packages/filesystem#3.7#x86_64#1.tar.xz \
   /var/packages/downloads/glibc#2.36#x86_64#10.tar.xz \
   /var/packages/downloads/readline#8.2.13#x86_64#1.tar.xz \
   /var/packages/downloads/ncurses#6.5#x86_64#1.tar.xz \
   /var/packages/downloads/libcap#2.73#x86_64#1.tar.xz \
   /var/packages/downloads/kpkg#145#x86_64#1.tar.xz \
   /var/packages/downloads/coreutils#9.6#x86_64#1.tar.xz \
   /var/packages/downloads/bash#5.2.37#x86_64#1.tar.xz
(cd ${ROOT} && tar cpf ../kwortfs.tar . && gzip ../kwortfs.tar)

