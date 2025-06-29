# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Extensible Wayland compositor with dynamic window management"
HOMEPAGE="https://github.com/Cudiph/cwcwm"
SRC_URI="https://github.com/Cudiph/cwcwm"

EGIT_REPO_URI="https://github.com/Cudiph/cwcwm.git"
EGIT_BRANCH="main"
inherit autotools git-r3

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/luajit x11-base/xwayland dev-build/ninja dev-libs/wayland-protocols
>=gui-libs/wlroots-9999"
RDEPEND="${DEPEND}"
BDEPEND=""
src_configure() {
	meson setup build -Dplugins=true --buildtype=release
	ninja -C build
	make docs
}

src_install() {
	DESTDIR="${D}" make install || echo "install failed"
}
