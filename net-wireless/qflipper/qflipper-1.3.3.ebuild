# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils xdg-utils

DESCRIPTION="Desktop application for updating Flipper Zero firmware via PC"
HOMEPAGE="https://update.flipperzero.one/"
SRC_URI="https://github.com/flipperdevices/qFlipper/tarball/bfce851d4da5a01f24189ba79eac9385b7ce8533 -> qFlipper-1.3.3-bfce851.tar.gz"
LICENSE="GPL-3+"
KEYWORDS="*"

SLOT="0"
IUSE="+qt5"
REQUIRED_USE="^^ ( qt5 )"

RDEPEND="
	>=dev-libs/nanopb-0.4.5[pb-malloc]
	qt5? (
		dev-qt/qtconcurrent:5=
		dev-qt/qtcore:5=
		dev-qt/qtdeclarative:5=
		dev-qt/qtgui:5=
		dev-qt/qtnetwork:5=
		dev-qt/qtquickcontrols:5=
		dev-qt/qtquickcontrols2:5=
		dev-qt/qtserialport:5=
		dev-qt/qtsvg:5=
		dev-qt/qtwidgets:5=
	)
	sys-libs/zlib:=
	virtual/libusb:1
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-1.3.0_unbundle.patch"
)

src_unpack() {
	unpack "${A}"
	mv "${WORKDIR}"/flipperdevices-qFlipper-* "${S}"
}

src_prepare() {
	default

	# Necessary patches
	sed -i "s/GIT_VERSION = .*/GIT_VERSION = ${PV}/g" "${S}"/qflipper_common.pri
	sed -i "s/GIT_COMMIT = .*/GIT_COMMIT = unknown/g" "${S}"/qflipper_common.pri
	sed -i "s/GIT_TIMESTAMP = .*/GIT_TIMESTAMP = 0/g" "${S}"/qflipper_common.pri
	sed -i '1 aINCLUDEPATH += "/usr/include/nanopb"' "${S}"/qflipper_common.pri
}

src_configure() {
	eqmake5 qFlipper.pro PREFIX="${EPREFIX}/usr" -spec linux-g++ \
		CONFIG+=qtquickcompiler DEFINES+=DISABLE_APPLICATION_UPDATES
}

src_compile() {
	emake qmake_all # rebuild Makefiles in subdirs
	emake
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${ED}" install
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}