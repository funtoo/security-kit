# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="nwipe secure disk eraser"
HOMEPAGE="https://github.com/martijnvanbrummelen/nwipe"
SRC_URI="https://github.com/martijnvanbrummelen/nwipe/tarball/63c64b91e44813b1e685f3af214c5bb047df3b31 -> nwipe-0.35-63c64b9.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="smartmontools"

RDEPEND="
	sys-apps/dmidecode
	sys-block/parted
	sys-libs/ncurses:=
	smartmontools? ( sys-apps/smartmontools )
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

post_src_unpack() {
	if [ ! -d "${S}" ]; then
			mv martijnvanbrummelen-nwipe* "${S}" || die
	fi
}

src_prepare() {
	default
	eautoreconf
}