VERSION=`cat metar.pl|grep VERSION=\"|cut -d '"' -f2`
DEST_DIR=/usr/local/bin
SRC=metar.pl
TARGET=metar
DIST_DIR=metar
SHELL=/bin/bash

all:

.PHONY: clean install uninstall dist

clean:

install:
	cp ${SRC} ${DEST_DIR}/${TARGET}
	
uninstall:
	rm -f ${DEST_DIR}/${TARGET}

dist:
	mkdir ${DIST_DIR}
	cp ${SRC} ${DIST_DIR}/
	cp Makefile ${DIST_DIR}/
	cp README.md ${DIST_DIR}/
	tar -cvzf ${TARGET}-${VERSION}.tar.gz ${DIST_DIR}/
	rm -f ./${DIST_DIR}/*
	rmdir ${DIST_DIR}

clean:
	rm -f ./${DIST_DIR}/*
	rmdir ${DIST_DIR}
	