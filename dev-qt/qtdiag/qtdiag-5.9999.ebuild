# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
QT5_MODULE="qttools"
inherit qt5-build

DESCRIPTION="Tool for reporting diagnostic information about Qt and its environment"

if [[ ${QT5_BUILD_TYPE} == release ]]; then
	KEYWORDS="~amd64 ~arm ~hppa ~ppc64 ~x86"
fi

IUSE="+ssl"

DEPEND="
	>=dev-qt/qtcore-${PV}:5
	>=dev-qt/qtgui-${PV}:5
	>=dev-qt/qtnetwork-${PV}:5[ssl=]
"
RDEPEND="${DEPEND}"

QT5_TARGET_SUBDIRS=(
	src/qtdiag
)
