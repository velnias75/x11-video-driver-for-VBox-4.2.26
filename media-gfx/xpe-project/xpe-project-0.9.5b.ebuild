# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

WX_GTK_VER="2.8"

inherit autotools flag-o-matic multilib versionator wxwidgets

MY_PV=$(replace_version_separator 1 '_' )
MY_PV=$(replace_version_separator 2 '_' $MY_PV)
MY_P="xpe_project_v${MY_PV}"

DESCRIPTION="A graphical editor for Povray based on wxWidgets library"
HOMEPAGE="http://nextpe.sourceforge.net/"
SRC_URI="mirror://sourceforge/nextpe/${MY_P}.tar.gz
	linguas_de? ( mirror://sourceforge/nextpe/xpe_v_0_9_3_german_hebens.xml )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="linguas_de"

RDEPEND=">=app-eselect/eselect-wxwidgets-0.7-r1"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}"/xpe_project

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.9.5b-fix-cxxflags.patch
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install

	dodoc AUTHORS ChangeLog NEWS

	if use linguas_de ; then
		insinto /usr/share/xpe
		doins "${DISTDIR}"/xpe_v_0_9_3_german_hebens.xml
	fi

	newicon -s 16 "${S}/src/bitmaps/hi16-app-xpe.png" xpe.png
	newicon -s 32 "${S}/src/bitmaps/hi32-app-xpe.png" xpe.png

	domenu "${FILESDIR}/xpe.desktop"
}
