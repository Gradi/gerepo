EAPI=8

inherit git-r3

DESCRIPTION="Zig language server"
HOMEPAGE="https://github.com/zigtools/zls"
LICENSE="MIT"

EGIT_REPO_URI="https://github.com/zigtools/zls.git"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

DEPEND="
	=dev-lang/zig-9999
"
RDEPEND="${DEPEND}"

src_compile() {
	cd "${S}"
	/opt/zig/zig-9999/bin/zig build
}

src_install() {
	cd "${S}"
	/opt/zig/zig-9999/bin/zig build --prefix "${D}/opt/zig/zls-9999/" install
	doenvd "${FILESDIR}/99zls"
}
