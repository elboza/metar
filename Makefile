VERSION=`cat metar.pl|grep VERSION=\"|cut -d '"' -f2`
BINDIR=/usr/local/bin
MANDIR=/usr/local/share/man/man1
SRC=metar.pl
TARGET=metar
DIST_DIR=metar
MANSRC=man/${TARGET}.man
MANTARGET=${TARGET}.1
SHELL=/bin/bash

all: help

.PHONY: clean install uninstall dist

install:
	mkdir -p ${DESTDIR}${BINDIR}
	cp -p ${SRC} ${DESTDIR}${BINDIR}/${TARGET}
	chmod 555 ${DESTDIR}${BINDIR}/${TARGET}
	mkdir -p ${DESTDIR}${MANDIR}
	cp -p ${MANSRC} ${DESTDIR}${MANDIR}/${MANTARGET}
	chmod 644 ${DESTDIR}${MANDIR}/${MANTARGET}

uninstall:
	rm -f ${DESTDIR}${BINDIR}/${TARGET}
	rm -f ${DESTDIR}${MANDIR}/${MANTARGET}

dist:
	mkdir ${DIST_DIR}
	cp ${SRC} ${DIST_DIR}/
	cp Makefile ${DIST_DIR}/
	cp README.md ${DIST_DIR}/
	mkdir -p ${DIST_DIR}/man
	cp -p ${MANSRC} ${DIST_DIR}/${MANSRC}
	COPYFILE_DISABLE=1 tar -cvzf ${TARGET}-${VERSION}.tar.gz ${DIST_DIR}/
	rm -rf ./${DIST_DIR}/*
	rmdir ${DIST_DIR}

clean:
	rm -rf ./${DIST_DIR}/*
	rmdir ${DIST_DIR}

help:
	@ echo "The following targets are available"
	@ echo "help      - print this message"
	@ echo "install   - install everything"
	@ echo "uninstall - uninstall everything"
	@ echo "clean     - remove any temporary files"
	@ echo "dist      - make a dist .tar.gz tarball package"

