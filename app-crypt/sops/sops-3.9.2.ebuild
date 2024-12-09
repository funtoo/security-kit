# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/3ab69975bc1f7a75a5e75ab1cee5da8a6a07bf34 -> sops-3.9.2-3ab6997.tar.gz
https://direct.funtoo.org/ba/a0/c8/baa0c86c1403ad24022719aa26d5f998e25c730c300ef8342b4f810ed429c6e11eb83a6d04a89befa92f59c11993266fed09ba4d08e967695b50047f647c7803 -> sops-3.9.2-funtoo-go-bundle-e17b836849e35131abfbe520255ad640f457cfd164240ca0eb29ec28cb3c34d8cffaeaff3e88a5332d856d319d106938f2f5955e2b859c260f9844a951b79d8f.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-3ab6997"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}