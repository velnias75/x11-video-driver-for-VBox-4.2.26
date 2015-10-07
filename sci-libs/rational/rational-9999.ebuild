# Copyright 2015 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils git-r3

DESCRIPTION="A C++ rational (fraction) template class"
HOMEPAGE="https://github.com/velnias75/rational"
EGIT_REPO_URI="http://github.com/velnias75/rational.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

EGIT_BRANCH="ExpressionTemplates"

RDEPEND="dev-libs/gmp[cxx]"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf "--docdir=/usr/share/doc/${PF}"
}
