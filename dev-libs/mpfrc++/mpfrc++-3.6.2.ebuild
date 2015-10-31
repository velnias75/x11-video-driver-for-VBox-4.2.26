# Copyright 2015 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="MPFR C++ wrapper"
HOMEPAGE="http://www.holoborodko.com/pavel/mpfr/"
SRC_URI="http://www.holoborodko.com/pavel/downloads/${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="examples"

S=${WORKDIR}

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
