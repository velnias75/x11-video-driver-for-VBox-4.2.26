# Copyright 2018 Heiko Schaefer <heiko@rangun.de>
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_HANDBOOK="forceoptional"
QT_MINIMAL=5.7.1

inherit kde5 git-r3

DESCRIPTION="KRegExpEditor is a GUI for creating and editing regular expressions."
HOMEPAGE="https://github.com/KDE/kregexpeditor"
EGIT_REPO_URI="https://github.com/KDE/kregexpeditor.git"

KEYWORDS=""
IUSE=""

DEPEND="
        $(add_frameworks_dep kconfigwidgets)
        $(add_frameworks_dep kiconthemes)
        $(add_frameworks_dep kio)
        $(add_frameworks_dep ktextwidgets)
        $(add_frameworks_dep kwidgetsaddons)
        $(add_frameworks_dep kcrash)
        $(add_qt_dep qtgui)
        $(add_qt_dep qtwidgets)
        sys-devel/bison
        sys-devel/flex
"

RDEPEND="${DEPEND}"
