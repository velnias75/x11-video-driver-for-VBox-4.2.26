# Copyright 2018 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3 autotools

DESCRIPTION="Huffman code as C++ template"
HOMEPAGE="https://github.com/velnias75/huffman"
EGIT_REPO_URI="https://github.com/velnias75/huffman.git"

LICENSE="GPL-3"
KEYWORDS=""
SLOT="0"

EGIT_BRANCH="master"

DEPEND="
	virtual/pkgconfig
	>=sci-libs/rational-2.7
"
src_prepare() {
	eapply_user
	eautoreconf
}
