#!/usr/bin/env bash

FULL="${1}"
export ROOT=/usr/src/kwort/docker
rm -rf ${ROOT}
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
if [ "${FULL}" == "-f" ]; then
	kpkg install \
	   /var/packages/downloads/bc#1.08.1#x86_64#1.tar.xz \
	   /var/packages/downloads/db#5.3.28#x86_64#3.tar.xz \
	   /var/packages/downloads/diffutils#3.11#x86_64#1.tar.xz \
	   /var/packages/downloads/gawk#5.3.1#x86_64#1.tar.xz \
	   /var/packages/downloads/gettext#0.23.1#x86_64#1.tar.xz \
	   /var/packages/downloads/grep#3.11#x86_64#2.tar.xz \
	   /var/packages/downloads/groff#1.23.0#x86_64#1.tar.xz \
	   /var/packages/downloads/gzip#1.13#x86_64#1.tar.xz \
	   /var/packages/downloads/libffi#3.4.7#x86_64#1.tar.xz \
	   /var/packages/downloads/libgmp#6.3.0#x86_64#1.tar.xz \
	   /var/packages/downloads/libmpc#1.3.1#x86_64#1.tar.xz \
	   /var/packages/downloads/libmpfr#4.2.1#x86_64#1.tar.xz \
	   /var/packages/downloads/libnsl#2.0.1#x86_64#1.tar.xz \
	   /var/packages/downloads/libpipeline#1.5.8#x86_64#1.tar.xz \
	   /var/packages/downloads/libtool#2.5.4#x86_64#1.tar.xz \
	   /var/packages/downloads/libusb#1.0.27#x86_64#1.tar.xz \
	   /var/packages/downloads/linux-pam#1.7.0#x86_64#1.tar.xz \
	   /var/packages/downloads/cmake#3.31.5#x86_64#1.tar.xz \
	   /var/packages/downloads/make#4.4.1#x86_64#1.tar.xz \
	   /var/packages/downloads/nasm#2.16.03#x86_64#1.tar.xz \
	   /var/packages/downloads/sed#4.9#x86_64#2.tar.xz \
	   /var/packages/downloads/shadow#4.13#x86_64#2.tar.xz \
	   /var/packages/downloads/signify#0.13#x86_64#1.tar.xz \
	   /var/packages/downloads/which#2.23#x86_64#1.tar.xz \
	   /var/packages/downloads/xz#5.6.4#x86_64#1.tar.xz \
	   /var/packages/downloads/zlib#1.3.1#x86_64#1.tar.xz \
	   /var/packages/downloads/lzlib#1.14#x86_64#1.tar.xz \
	   /var/packages/downloads/acl#2.3.2#x86_64#1.tar.xz \
	   /var/packages/downloads/attr#2.5.2#x86_64#1.tar.xz \
	   /var/packages/downloads/autoconf#2.72#x86_64#1.tar.xz \
	   /var/packages/downloads/binutils#2.39#x86_64#1.tar.xz \
	   /var/packages/downloads/ca-certificates#20241231#x86_64#1.tar.xz \
	   /var/packages/downloads/curl#8.12.0#x86_64#1.tar.xz \
	   /var/packages/downloads/ed#1.21#x86_64#1.tar.xz \
	   /var/packages/downloads/elfutils#0.192#x86_64#2.tar.xz \
	   /var/packages/downloads/expat#2.6.4#x86_64#1.tar.xz \
	   /var/packages/downloads/file#5.46#x86_64#1.tar.xz \
	   /var/packages/downloads/findutils#4.10.0#x86_64#1.tar.xz \
	   /var/packages/downloads/gcc#12.4.0#x86_64#1.tar.xz \
	   /var/packages/downloads/gdbm#1.24#x86_64#1.tar.xz \
	   /var/packages/downloads/iana-etc#20240125#x86_64#1.tar.xz \
	   /var/packages/downloads/inetutils#2.5#x86_64#1.tar.xz \
	   /var/packages/downloads/iproute2#6.13.0#x86_64#1.tar.xz \
	   /var/packages/downloads/less#668#x86_64#1.tar.xz \
	   /var/packages/downloads/libarchive#3.7.7#x86_64#1.tar.xz \
	   /var/packages/downloads/libdevmapper#1.02.204#x86_64#1.tar.xz \
	   /var/packages/downloads/libtirpc#1.3.6#x86_64#1.tar.xz \
	   /var/packages/downloads/man-db#2.13.0#x86_64#1.tar.xz \
	   /var/packages/downloads/man-pages#6.10#x86_64#1.tar.xz \
	   /var/packages/downloads/openssh#9.9p1#x86_64#1.tar.xz \
	   /var/packages/downloads/openssl#3.4.0#x86_64#1.tar.xz \
	   /var/packages/downloads/perl#5.36.3#x86_64#1.tar.xz \
	   /var/packages/downloads/procps#4.0.5#x86_64#1.tar.xz \
	   /var/packages/downloads/psmisc#23.7#x86_64#1.tar.xz \
	   /var/packages/downloads/python3#3.10.16#x86_64#1.tar.xz \
	   /var/packages/downloads/sudo#1.9.16p2#x86_64#1.tar.xz \
	   /var/packages/downloads/sysklogd#2.7.0#x86_64#1.tar.xz \
	   /var/packages/downloads/tar#1.35#x86_64#1.tar.xz \
	   /var/packages/downloads/tzdata#2025a#x86_64#1.tar.xz \
	   /var/packages/downloads/util-linux#2.40.4#x86_64#1.tar.xz \
	   /var/packages/downloads/vim#9.1.1055#x86_64#1.tar.xz \
	   /var/packages/downloads/zstd#1.5.6#x86_64#1.tar.xz \
	   /var/packages/downloads/bin86#0.16.21#x86_64#3.tar.xz \
	   /var/packages/downloads/lftp#4.9.3#x86_64#1.tar.xz \
	   /var/packages/downloads/unzip#6.0#x86_64#8.tar.xz \
	   /var/packages/downloads/sqlite3#3.49.0#x86_64#1.tar.xz \
	   /var/packages/downloads/wget#1.25.0#x86_64#1.tar.xz \
	   /var/packages/downloads/bindutils#9.20.5#x86_64#1.tar.xz \
	   /var/packages/downloads/dialog#1.3-20250116#x86_64#1.tar.xz \
	   /var/packages/downloads/mc#4.8.33#x86_64#1.tar.xz \
	   /var/packages/downloads/tmux#3.5a#x86_64#1.tar.xz \
	   /var/packages/downloads/unrar#7.1.3#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/core/libpcre#8.45#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/core/m4#1.4.19#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/core/mpdecimal#2.5.1#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/core/bzip2#1.0.8#x86_64#3.tar.xz \
	   ${ROOT}/../iso/packages/core/automake#1.16.5#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/core/flex#2.6.4#x86_64#2.tar.xz \
	   ${ROOT}/../iso/packages/core/kbd#2.4.0#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/core/lzo#2.10#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/core/patch#2.7.6.17-9c98#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/core/time#1.9#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/core/bison#3.8.2#x86_64#1.tar.xz \
	   ${ROOT}/../iso/packages/opt/kwort-tools#0.2#x86_64#1.tar.xz
fi
if [ "${FULL}" == "-f" ]; then
	(cd ${ROOT} && tar cpf /tmp/kwort-docker/full/kwortfs.tar . && gzip /tmp/kwort-docker/full/kwortfs.tar)
else
	(cd ${ROOT} && tar cpf /tmp/kwort-docker/minimal/kwortfs.tar . && gzip /tmp/kwort-docker/minimal/kwortfs.tar)
fi
rm -rf ${ROOT}
