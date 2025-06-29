# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
#inherit cmake

DESCRIPTION="plugin for steam to unlock the option to remote play with any app."
HOMEPAGE="https://github.com/m4dEngi/RemotePlayWhatever"
#SRC_URI="https://github.com/m4dEngi/RemotePlayWhatever/archive/refs/tags/${PV}-alpha.tar.gz"
#git-r3_fetch https://github.com/m4dEngi/RemotePlayWhatever.git

#if [[ ${PV} == *9999 ]]; then
EGIT_REPO_URI="https://github.com/m4dEngi/RemotePlayWhatever.git"
EGIT_BRANCH="master"
inherit autotools git-r3
KEYWORDS="~amd64 ~x86"
#else
#	SRC_URI="https://github.com/maxsatula/ocp/releases/download/v${PV}/${P}.tar.gz"
#fi


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


src_configure() {
	mkdir build
	cd build
	cmake ../ || die "cmake configure failed"

}

src_install() {
	cd build

	# make install just calls `make` and then `cmake -P cmake_install.cmake`
	#make DESTDIR=${D} install || die "make install failed"

	make DESTDIR=${D}
	# this cmake install command is being run separately from make because we are overriding the install prefex from /usr/local/bin
	# to /usr.
	# its /usr and not /usr/bin because at some point /bin gets appended at then end meaning overriding it with /usr/bin gets turned into /usr/bin/bin meaning I have to use /usr
	cmake -DCMAKE_INSTALL_PREFIX=${D}/usr/ -P cmake_install.cmake
}


