# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit qt4-build

DESCRIPTION="The OpenGL module for the Qt toolkit"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="qt3support"

DEPEND="~x11-libs/qt-core-${PV}[debug=,qt3support=]
	~x11-libs/qt-gui-${PV}[debug=,qt3support=]
	virtual/opengl"
RDEPEND="${DEPEND}"

pkg_setup() {
	QT4_TARGET_DIRECTORIES="
		src/opengl
		src/plugins/graphicssystems/opengl"

	QT4_EXTRACT_DIRECTORIES="
		include/QtCore
		include/QtGui
		include/QtOpenGL
		src/corelib
		src/gui
		src/opengl
		src/plugins
		src/3rdparty"

	QCONFIG_ADD="opengl"
	QCONFIG_DEFINE="QT_OPENGL $(use egl && echo QT_EGL)"
	qt4-build_pkg_setup
}

src_configure() {
	myconf="${myconf} -opengl
		$(qt_use qt3support)"

	qt4-build_src_configure

	# Not building tools/designer/src/plugins/tools/view3d as it's
	# commented out of the build in the source
}