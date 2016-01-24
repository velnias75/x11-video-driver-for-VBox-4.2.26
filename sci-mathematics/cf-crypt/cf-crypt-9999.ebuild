# Copyright 2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools-utils flag-o-matic git-r3

DESCRIPTION="En-/decrypts cf-crypts"
HOMEPAGE="https://github.com/velnias75/cf-crypt"
EGIT_REPO_URI="http://github.com/velnias75/cf-crypt.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	sci-libs/rational:0[gmp]
	virtual/pkgconfig
"

src_prepare() {
	eautoreconf
}

src_configure() {

	append-cppflags -DNDEBUG

	local myeconfargs=(
		"--docdir=/usr/share/doc/${PF}"
	)

	autotools-utils_src_configure
}
