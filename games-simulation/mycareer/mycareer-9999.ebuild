# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils games git-r3

DESCRIPTION="Small career simulation in Qt4"
HOMEPAGE="https://github.com/velnias75/MyCareer"
EGIT_REPO_URI="http://github.com/velnias75/MyCareer.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
"

pkg_setup() {
	games_pkg_setup
}

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {

	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${GAMES_PREFIX}"
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_test() {
	cmake-utils_src_test
}

src_install() {
	cmake-utils_src_install
	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
}

pkg_postinst() {
	games_pkg_postinst
}
