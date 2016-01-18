# Copyright 2015 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools-utils

DESCRIPTION="An implementation of double-array trie."
HOMEPAGE="http://linux.thai.net/~thep/datrie/datrie.html"
SRC_URI="http://linux.thai.net/pub/thailinux/software/libthai/${P}.tar.xz"
LICENSE="LGPL-2.1"
SLOT="1/3"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( >=app-doc/doxygen-1.8.8 )"
RDEPEND="${DEPEND}"

src_configure() {

	local myeconfargs=(
		"--docdir=/usr/share/doc/${PF}"
		"--enable-static"
		$(use_enable doc doxygen-doc)
	)

	autotools-utils_src_configure
}

src_install() {

	if use doc; then
		dohtml -r "${BUILD_DIR}"/doc/html/*
	fi

	autotools-utils_src_install

	if use doc; then
		rm -rf "${D}"/usr/share/doc/datrie
	fi
}
