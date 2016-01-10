# Copyright 2015 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="MPFR C++ wrapper"
HOMEPAGE="http://www.holoborodko.com/pavel/mpfr/"
SRC_URI="https://bitbucket.org/advanpix/mpreal/get/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="examples"

S=${WORKDIR}/advanpix-mpreal-bed0adf08642

DEPEND="
	>=dev-libs/mpfr-2.3.1
	>=dev-libs/gmp-4.2.1
"

src_install() {

	insinto /usr/include
	doins mpreal.h

	dodoc changelog copying.txt README.md

	if use examples; then
		insinto "/usr/share/${PN}"
		doins -r example
	fi
}
