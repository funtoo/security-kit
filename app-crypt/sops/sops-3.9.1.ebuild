# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/af949bd819de7094a450d6aab7a7a1ca2fa387be -> sops-3.9.1-af949bd.tar.gz
https://direct.funtoo.org/23/31/8d/23318d6b147a9d4a9c9b0628120747931d4e9ff4cede157c0297e80d6f8d3756d52651fb81e558d2bb8aa449d410828ea43055b78da6cffb583bd7974be925be -> sops-3.9.1-funtoo-go-bundle-2b8d674f65433b121e80b34f5cce186ea99350ed8a05c862f0ab9a7ef1722cce6e5a6eecfc43d0fb88a3e7c4af2cd9b942ce93a09760fcf13d6205e394a9cac7.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-af949bd"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}