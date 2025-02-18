#!/usr/bin/env bash

FULL="${1}"
export ROOT=/usr/src/kwort/docker
rm -rf ${ROOT}
mkdir -p ${ROOT}
export KPKG_DB_HOME=${ROOT}/var/packages/installed.kdb
mkdir -p $(dirname $KPKG_DB_HOME)
cp ${ROOT}/../iso/packages/installed.kdb "${KPKG_DB_HOME}"

UPDATE_PACKAGES=/var/packages/downloads
ORIG_PACKAGES=${ROOT}/../iso/packages

red_alert() {
	[ -t 1 ] && tput setaf 1
	echo $*
	[ -t 1 ] && tput sgr0
}

install_pkgs() {
	for pkg in $@; do
		out=$(find ${UPDATE_PACKAGES} -name "${pkg}#*")
		if [ -n "${out}" ]; then
			kpkg install ${out}
		else
			out=$(find ${ORIG_PACKAGES} -name "${pkg}#*")
			if [ -n "${out}" ]; then
				kpkg install ${out}
			else
				red_alert "Package ${pkg} not found in any of the paths"
			fi
		fi
	done
}

kpkg install ${ORIG_PACKAGES}/filesystem#*
install_pkgs glibc readline ncurses libcap kpkg coreutils bash

[ "${FULL}" == "-f" ] && install_pkgs bc db diffutils gawk gettext grep groff gzip libffi libgmp libmpc libmpfr libnsl libpipeline libtool libusb linux-pam cmake make nasm sed shadow signify which xz zlib lzlib acl attr autoconf binutils ca-certificates curl ed elfutils expat file findutils gcc gdbm iana-etc inetutils iproute2 less libarchive libdevmapper libtirpc libidn2 libbsd libunistring iputils man-db man-pages openssh openssl perl procps psmisc python3 sudo sysklogd tar tzdata util-linux vim zstd bin86 lftp unzip sqlite3 wget bindutils dialog mc tmux unrar libpcre m4 mpdecimal bzip2 automake flex kbd lzo patch time bison dumb_runtime_dir kwort-tools

if [ "${FULL}" == "-f" ]; then
	(cd ${ROOT} && tar cpf /tmp/kwort-docker/full/kwortfs.tar . && gzip /tmp/kwort-docker/full/kwortfs.tar)
else
	(cd ${ROOT} && tar cpf /tmp/kwort-docker/minimal/kwortfs.tar . && gzip /tmp/kwort-docker/minimal/kwortfs.tar)
fi
rm -rf ${ROOT}
