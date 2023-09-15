# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/a750d7297bdffe4bd40bdb5c28907fea08467f17 -> sops-3.8.0-a750d72.tar.gz
https://direct.funtoo.org/11/74/f3/1174f320f42ba843139ccfe73e1901229d1aaa4ad994e2696b06a232784ad97ac9de9c1bfa3bf631ebdbd98fca807d911f74c0a665a867f2e302512e95c3b4ba -> sops-3.8.0-funtoo-go-bundle-5203dd154baabbad2eb8469bb753b688c19fc054b9e840228e9bec4d443b1546a54e94ac99a0f98701941e9e97666e6334075a9fe48957a55d58b8a6ec5ab147.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-a750d72"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}