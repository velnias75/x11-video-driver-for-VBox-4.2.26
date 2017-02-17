# Copyright 2016 Heiko Schäfer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools flag-o-matic git-r3

DESCRIPTION="Very simple, quick & dirty subrip (srt) fixer"
HOMEPAGE="https://github.com/velnias75/fixsrt"
EGIT_REPO_URI="http://github.com/velnias75/fixsrt.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="static-libs"

DEPEND=""
RDEPEND="
	${DEPEND}
"

src_prepare() {
	eautoreconf
	eapply_user
}

src_configure() {
	append-cppflags -DNDEBUG
	econf $(use_enable static-libs static)
}
