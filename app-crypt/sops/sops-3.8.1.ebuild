# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/47d295c3b662449b4ee664f13a3b6c665e18b011 -> sops-3.8.1-47d295c.tar.gz
https://direct.funtoo.org/2d/60/fe/2d60fe76071b51d16b03b331eb7dbc6aa57e2bf3e47fb32c564cc072648bc5a667cf79c6b1db22c655734ffa2df9ce2cbb40a3de1a3a2d3ddafccbb5d90dc7e3 -> sops-3.8.1-funtoo-go-bundle-5cf875ea4accd8e338228512ae992b7c7ede9bb44d32084f20ffbf3d90b061ebc99ca03ad1e3c0871ea25ff2efb7cc3890461b9d0860ae998646a6cdb3204eaa.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-47d295c"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}