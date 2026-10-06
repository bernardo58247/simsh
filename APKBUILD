# Maintainer: bernardo <bernardo58247@gmail.com>

pkgname=SimSH
pkgver=1.0.0
pkgrel=0
pkgdesc="A new shell written in ruby"
url="https://example.com"
arch="all"
license="MIT"

depends=""
makedepends=""

source="$pkgname-$pkgver.tar.gz"
subpackages=""

build() {
	:
}

check() {
	:
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc"
	mkdir -p "$pkgdir/usr/lib/simsh"

	cp bin/simsh "$pkgdir/usr/bin/simsh"
	cp etc/simshconfig.rb "$pkgdir/etc/simshconfig.rb"
	cp lib_rb/color.rb "$pkgdir/usr/lib/simsh/color.rb"
}

sha512sums="
"
