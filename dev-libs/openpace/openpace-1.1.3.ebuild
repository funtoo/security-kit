# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Cryptographic library for EAC version 2"
HOMEPAGE="https://frankmorgner.github.io/openpace"
SRC_URI="https://github.com/frankmorgner/openpace/releases/download/1.1.3/openpace-1.1.3.tar.gz -> openpace-1.1.3.tar.gz"

LICENSE="GPL-3"
SLOT="0/3"
KEYWORDS="*"

BDEPEND="
	dev-util/gengetopt
	sys-apps/help2man
	virtual/pkgconfig"
DEPEND="dev-libs/openssl:="
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--disable-openssl-install \
		--disable-go \
		--disable-java \
		--disable-python \
		--disable-ruby
}

src_compile() {
	# not running just 1 job causes a race condition that causes a linking error
	emake -j1
}

src_install() {
	default

	find "${ED}" -type f -name '*.la' -delete || die
}