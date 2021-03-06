# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/qtermwidget/qtermwidget-9999.ebuild,v 1.4 2014/12/15 21:17:34 pesa Exp $

EAPI=5
inherit cmake-utils git-r3

DESCRIPTION="Qt terminal emulator widget"
HOMEPAGE="https://github.com/qterminal/qtermwidget"
EGIT_REPO_URI="https://github.com/qterminal/qtermwidget.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="debug qt4 qt5"
REQUIRED_USE="^^ ( qt4 qt5 )"

DEPEND="
	qt4? ( dev-qt/designer:4
		dev-qt/qtcore:4
		dev-qt/qtgui:4 )
	qt5? ( dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5 )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_use qt5)
		$(cmake-utils_use_build qt4 DESIGNER_PLUGIN)
	)
	cmake-utils_src_configure
}
