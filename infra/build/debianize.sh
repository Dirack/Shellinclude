#!/bin/bash

# Script for building a debian package using DPKG

# Set up the following variables based on your package
PACKAGENAME=shellunity
VERSION=$(git tag | sort -r | tr '\n' ' ' | cut -d" " -f1)
VERSION=${VERSION##*v}
BIN=bin
MANUALS="docs/man1"
DESCRIPTION="Framework de testes unitários em Shell Script"
MANTAINER="Rodolfo A C Neves (Dirack) <https://www.geofisicando.com>"
ORIGINAL_MANTAINER="GPGEOF <https://github.com/gpgeof>"
BUGS="<https://github.com/Dirack/ShellUnity/issues>"
HOMEPAGE="<https://github.com/Dirack/ShellUnity/wiki>"
DEPENDS="bash"

if [ -z "$VERSION" ]
then
	VERSION="$(cat ../../docs/VERSION.md)-dev"
fi

CONTROL="Package: ${PACKAGENAME:=mypackage}
Version: ${VERSION:=0.0.0-dev}
Architecture: all
Priority: optional
Essential: no
Maintainer: ${MANTAINER:='Rodolfo A C Neves (Dirack) <https://www.geofisicando.com>'}
Original-Maintainer: ${MANTAINER:='GPGEOF <https://github.com/gpgeof>'}
Bugs: ${BUGS:='GPGEOF \<https://github.com/gpgeof\>'}
Homepage: ${HOMEPAGE:='GPGEOF <https://github.com/gpgeof>'}
Depends: ${DEPENDS:='bash'}
Description: ${DESCRIPTION:=Just a test! :)}
"

mkdir bin
cp ../../src/shellunity bin

mkdir -p docs
cp -r ../../docs docs
mv docs/docs docs/man1

mkdir -p ${PACKAGENAME}_${VERSION}_all/DEBIAN

echo "$CONTROL" > ${PACKAGENAME}_${VERSION}_all/DEBIAN/control

if [ -d "$BIN" ]
then
	mkdir -p ${PACKAGENAME}_${VERSION}_all/usr
	cp -r ${BIN} ${PACKAGENAME}_${VERSION}_all/usr
else
	echo "BIN variable is not setup or BIN directory not found!"
	exit 1
fi

if [ -d "$MANUALS" ]
then
	mkdir -p ${PACKAGENAME}_${VERSION}_all/usr/share/man
	cp -r ${MANUALS} ${PACKAGENAME}_${VERSION}_all/usr/share/man
else
	echo "MANUALS variable is not setup or MANUALS directory not found!"
	exit 1
fi


# Build using the following command
dpkg-deb -b ${PACKAGENAME}_${VERSION}_all
