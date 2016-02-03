# Copyright 2016 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils vcs-snapshot

DESCRIPTION="Standard Template Library for Extra Large Data Sets"
HOMEPAGE="https://github.com/stxxl/stxxl"
SRC_URI="https://github.com/stxxl/stxxl/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="boost openmp static-libs test tools threads"

RDEPEND="
	boost? ( dev-libs/boost )
	openmp? ( sys-devel/gcc[openmp] )
"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_prepare() {
	epatch "${FILESDIR}/${P}-cstring.patch"
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=TRUE
		-DBUILD_EXAMPLES=OFF
		$(cmake-utils_use_use openmp GNU_PARALLEL)
		$(cmake-utils_use_use boost BOOST)
		$(cmake-utils_use_use threads STD_THREADS)
		$(cmake-utils_use_build static-libs STATIC_LIBS)
		$(cmake-utils_use_build tools EXTRAS)
		$(cmake-utils_use_build test TESTS)
	)

	cmake-utils_src_configure
}
