# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A desktop electron pokerouge port."
HOMEPAGE="https://github.com/Admiral-Billy/Pokerogue-App"
SRC_URI="https://github.com/Admiral-Billy/Pokerogue-App/releases/download/v$PVR/PokeRogue-Linux.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install(){
	mkdir "${D}/opt"
	mv "$(pwd)" "${D}/opt/rogue"
	chmod 755 "${D}/opt/rogue"
	chmod 777 "${D}/opt/rogue/resources"
	#install "$(pwd)" "${D}/opt"

}
