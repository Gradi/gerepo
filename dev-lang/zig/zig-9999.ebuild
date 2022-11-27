EAPI=8

inherit cmake llvm git-r3

DESCRIPTION="Zig programming language compiled from specific git latest HEAD revision"
HOMEPAGE="https://ziglang.org/"
LICENSE="MIT"

EGIT_REPO_URI="https://github.com/ziglang/zig.git"
EGIT_COMMIT="609716524169c538b7f12666c3f9bb46a0aeeb3c"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

DEPEND="
	dev-util/cmake
	sys-devel/llvm:15=
	sys-devel/clang:15=
	sys-devel/lld:15="
RDEPEND="
	sys-devel/llvm:15=
	sys-devel/clang:15=
	sys-devel/lld:15"

src_configure() {
	local llvmPrefix=$(get_llvm_prefix 15)
	local CC="${llvmPrefix}/bin/clang"
	local CXX="${llvmPrefix}/bin/clang++"

	local mycmakeargs=(
		"-DCMAKE_PREFIX_PATH=${llvmPrefix}"
		"-DCMAKE_C_COMPILER=${CC}"
		"-DCMAKE_CXX_COMPILER=${CXX}"
		"-DCMAKE_INSTALL_PREFIX=/opt/zig-9999/"

		"-DZIG_USE_CCACHE=OFF"
		"-DZIG_SHARED_LLVM=ON"
	)
	local CMAKE_BUILD_TYPE='Debug'

	cmake_src_configure
}
