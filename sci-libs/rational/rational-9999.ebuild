# Copyright 2015 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools-utils git-r3

DESCRIPTION="A C++ rational (fraction) template class"
HOMEPAGE="https://github.com/velnias75/rational"
EGIT_REPO_URI="https://github.com/velnias75/rational.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="cln gmp mpfr test"

EGIT_BRANCH="master"

RDEPEND="
	cln? ( >=sci-libs/cln-1.3.2 )
	gmp? ( dev-libs/gmp[cxx] )
	mpfr? ( dev-libs/mpfrc++ )
"

DEPEND="
	${RDEPEND}
	test? ( >=dev-util/cppunit-1.14 )
	virtual/pkgconfig
"

src_prepare() {
	eautoreconf
}

src_configure() {

	local myeconfargs=(
		"--docdir=/usr/share/doc/${PF}"
		$(use_enable cln)
		$(use_enable gmp)
		$(use_with mpfr mpreal)
		--disable-infint
	)

	autotools-utils_src_configure
}
