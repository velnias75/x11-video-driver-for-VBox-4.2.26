# Copyright 2018 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit desktop autotools-utils git-r3 flag-o-matic xdg-utils

DESCRIPTION="Chaos Strikes Back for Linux"
HOMEPAGE="https://github.com/velnias75/csbwin_for_linux"
EGIT_REPO_URI="https://github.com/velnias75/csbwin_for_linux.git"

LICENSE="LGPL-3"
KEYWORDS="~x86"
SLOT="0"

EGIT_BRANCH="master"

DOCS=(	AUTHORS
		ChangeLog
		CHANGES.TXT
		ConfigMac.txt
		config.txt
		config.linux
		COPYING
		CSBWIN_LINUX_LIESMICH.TXT
		CSBWIN_LINUX_README.TXT
		i386.binzipname.txt
		i486.binzipname.txt
		ornate_floor_wall_types.txt
		README.linux
		ReleaseNotes.txt
		srczipname.txt
		x86_64.binzipname.txt
	)

DEPEND="
	virtual/pkgconfig
	dev-libs/glib
	media-libs/libsdl
	media-sound/alsa-utils
"
src_prepare() {
	eautoreconf
}

src_configure() {

	append-cppflags -DNDEBUG -D_NDEBUG -DG_DISABLE_ASSERT
	append-cxxflags -std=c++03
	append-cflags -std=c99

	local myeconfargs=(
		--disable-esound
		--disable-dynwinsize
	)

	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install

	make_desktop_entry "CSBwin-linux.sh" "Chaos Strikes Back" "/usr/share/icons/hicolor/32x32/apps/CSBwin.xpm"
	doicon -s 32 "${WORKDIR}/${PF}/src/CSBwin.xpm"
	newicon -s 16 "${WORKDIR}/${PF}/src/small.xpm" CSBwin.xpm
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
