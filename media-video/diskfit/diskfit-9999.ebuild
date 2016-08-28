# Copyright 2016 Heiko Schäfer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools flag-o-matic git-r3

DESCRIPTION="Simple disk fit calculator"
HOMEPAGE="https://github.com/velnias75/diskfit"
EGIT_REPO_URI="http://github.com/velnias75/diskfit.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="static-libs"

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-libs/glib:2
	virtual/pkgconfig
"

src_prepare() {
	eautoreconf
	eapply_user
}

src_configure() {
	append-cppflags -DNDEBUG
	econf $(use_enable static-libs static)
}
