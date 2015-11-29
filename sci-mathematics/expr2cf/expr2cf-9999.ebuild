# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools-utils flag-o-matic git-r3

DESCRIPTION="Converts a simple mathematical expression to a continued fraction sequence "
HOMEPAGE="https://github.com/velnias75/expr2cf"
EGIT_REPO_URI="http://github.com/velnias75/expr2cf.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND=""

RDEPEND="
	${DEPEND}
	sci-libs/rational:0[gmp,mpfr]
	virtual/pkgconfig
"

src_prepare() {
	eautoreconf
}

src_configure() {

	append-cppflags -DNDEBUG

	local myeconfargs=( "--docdir=/usr/share/doc/${PF}" )

	autotools-utils_src_configure
}
