# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Discover CVEs for packages installed by the portage"
HOMEPAGE="https://github.com/mrl5/vulner"
SRC_URI="https://github.com/mrl5/vulner/releases/download/v0.7.1/vulner-v0.7.1.tar.gz -> vulner-v0.7.1.tar.gz
https://direct.funtoo.org/b6/e1/ce/b6e1ce2f4b449e841ff74621b3b2d1be83cadcc48d5a59ae35e15732d9c9fe64e02b03daaa4cb714fc1057cce329a3c5e14ddaad2cb050ebbdef75cfd367f4f2 -> vulner-0.7.1-funtoo-crates-bundle-df28f692372d1f438fd5f208561d70c815e249c7ebd4ee048847751bcc61500c738e8c9ee2d85cb393a06b6d2fb2fa9791e7f58d25cc49b47c83cd7ed170e398.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=">=dev-lang/python-3.7"
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/vulner"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mrl5-vulner-* ${S} || die
}

src_install() {
	cargo_src_install '--path' './crates/cli'
	einstalldocs
}