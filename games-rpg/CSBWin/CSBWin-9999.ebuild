# Copyright 2018 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools-utils git-r3 flag-o-matic

DESCRIPTION="Chaos Strikes Back for Linux"
HOMEPAGE="https://github.com/velnias75/csbwin_for_linux"
EGIT_REPO_URI="https://github.com/velnias75/csbwin_for_linux.git"

LICENSE="LGPL-3"
KEYWORDS="~x86"
SLOT="0"

EGIT_BRANCH="master"

DEPEND="
	virtual/pkgconfig
	dev-libs/glib
	media-libs/libsdl
"
src_prepare() {
	eautoreconf
}

src_configure() {

	append-cppflags -DNDEBUG -D_NDEBUG -DG_DISABLE_ASSERT

	local myeconfargs=(
		--disable-esound
		--disable-dynwinsize
	)

	autotools-utils_src_configure
}
