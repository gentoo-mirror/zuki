# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Firefox shim to add support for legacy extentions"
HOMEPAGE=""
SRC_URI="https://git.gir.st/LegacyFox.git/snapshot/v${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="firefox-bin"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
#S="${WORKDIR}"/*

src_unpack() {
	if [[ -n ${A} ]]; then
		#mv $A $PF
		unpack ${A}
		mv * $PF
	fi
}


#src_prepare(){
#	mv Leg* legacyfox-${PV}
#}

src_install() {
	if use firefox-bin; then
		DESTDIR_FIREFOX="${D}/opt/firefox"
	else
		DESTDIR_FIREFOX="${D}/lib64/firefox"
	fi
	mkdir -p "$DESTDIR_FIREFOX"
	# mkdir "${D}/lib64"
	# mkdir "${D}/lib64/firefox"
	make DESTDIR="$DESTDIR_FIREFOX" install || die "make install failed"
}


