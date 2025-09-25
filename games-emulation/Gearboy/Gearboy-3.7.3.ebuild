# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Game Boy / Gameboy Color emulator and debugger"
HOMEPAGE="https://github.com/drhelius/Gearboy"
SRC_URI="https://github.com/drhelius/Gearboy/archive/refs/tags/3.7.3.tar.gz"
# SRC_URI="https://github.com/drhelius/Gearboy/releases/download/v${PV}/${P}.tar.gz"

LICENSE="gpl3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-libs/gtk+ media-libs/libsdl2"
RDEPEND="${DEPEND}"
BDEPEND="x11-libs/gtk+ media-libs/libsdl2"

src_install() {
	mkdir -p "${D}/usr/share/applications" || die "failed to mkdir applications folder"

	echo '''[Desktop Entry]
Name=gearboy
Comment="Game Boy / Gameboy Color emulator and debugger"
Exec=gearboy
Terminal=false
Type=Application
Categories=Game;''' >> ${D}/usr/share/applications/gearboy.desktop

	eapply "${FILESDIR}/fix-3.7.3.patch" || die "failed to apply patch"
	cd platforms/linux
	make DESTDIR=${D} || die "failed to build"
	mkdir -p "${D}/bin"
	mv gearboy "${D}/bin/gearboy" || die "failed to install"
}
