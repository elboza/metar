# Copyright 1999-2013 Gentoo Foundation
# metar custom ebuild by xnando
# Distributed under the terms of the GNU General Public License v2
# $Header:$
	
# Please note that this file is still experimental !
#
# if you wonder how to use this ebuild :

# su
# 
# 
# mkdir -p /usr/local/portage/app-misc/metar
# cp metar-0.2.ebuild /usr/local/portage/app-misc/metar/
# cd /usr/local/portage/app-misc/metar
# ebuild  ${DWARF}.ebuild digest
# echo PORTDIR_OVERLAY=/usr/local/portage >> /etc/make.conf
# emerge metar

DESCRIPTION="a simple command line metar and taf"
HOMEPAGE="http://github.com/elboza/metar"
SRC_URI="http://www.autistici.org/0xFE/software/releases/metar/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-lang/perl
		dev-perl/libwww-perl"

RDEPEND=""

src_unpack() {
        unpack ${A}
        cd ${S}
}

S=${WORKDIR}/${PN}
src_install() {
    elog "installing ${P}"
	mkdir -p "${D}/usr/bin"
	cp "${S}"/metar.pl "${D}"/usr/bin/metar
}

