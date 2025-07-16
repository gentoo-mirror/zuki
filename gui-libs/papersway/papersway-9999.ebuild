# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a ipc plugin for sway to bring scrollable tilling to sway/i3wm"
HOMEPAGE="https://spwhitton.name/tech/code/papersway/"
SRC_URI="https://git.spwhitton.name/papersway"


EGIT_REPO_URI="https://git.spwhitton.name/papersway"
EGIT_BRANCH="master"
# inherit autotools git-r3
inherit git-r3

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND} dev-lang/perl dev-perl/JSON dev-perl/AnyEvent dev-perl/AnyEvent-I3"
BDEPEND=""
src_install() {
	mkdir -p "${D}/bin"
	mv bin/* "${D}/bin"
}
