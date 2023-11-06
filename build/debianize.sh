#!/bin/bash

VERSION=$1

[ -z "$VERSION" ] && {
	echo "You should define a package version!"
	echo "Usage: $(basename $0) v0.1.0"
	exit 1
}

PROGRAMS_CURRENT_VERSION="cabecalho comp img jonas lipsum toolbox mensagemAjuda mensagemErro"

CONTROL="Package: shellinclude
Version: ${VERSION}
Architecture: all
Priority: optional
Essential: no
Maintainer: Rodolfo A C Neves (Dirack) <https://www.geofisicando.com>
Original-Maintainer: GPGEOF <https://github.com/gpgeof>
Bugs: https://github.com/Dirack/Shellinclude/issues
Homepage: https://github.com/Dirack/Shellinclude/wiki
Depends: bash
Description: Programas utilitários em Shell Script para auxiliar em tarefas do cotidiano no Linux Ubuntu
 A Shellinclude é uma biblioteca shell script com vários programas utilitários que ajudam a facilitar tarefas rotineiras do programador no sistema operacional Linux Ubuntu.
 Os scripts da Shellinclude também podem ser utilizados como templates para outros programadores desenvolverem os seus próprios programas.
 .
 Programas da versão atual - v${VERSION}
 .
 lipsum: Gerar texto aleatório na tela do terminal (dummy text).
 cabecalho: Gerar cabeçalho para o código fonte de um programa com objetivo, nome do programa e etc.
 comp: Compilar e instalar programas na versão local do pacote de processamento sísmico MADAGASCAR.
 img: Converter .vpl (arquivos de imagem do MADAGASCAR) em imagens .jpeg
 jonas: Criar atalhos para pastas e aliases permanentes.
 .
 Scripts auxiliares:
 .
 mensagemErro.sh
 mensagemAjuda.sh"

mkdir -p shellinclude_${VERSION}_all/DEBIAN

echo "$CONTROL" > shellinclude_${VERSION}_all/DEBIAN/control

mkdir -p shellinclude_${VERSION}_all/usr/bin

mkdir -p shellinclude_${VERSION}_all/usr/share/man/man1

cd ..

cp ${PROGRAMS_CURRENT_VERSION} build/shellinclude_${VERSION}_all/usr/bin

MANUALS=$(ls manuais/*.1 | sed 's/manuais\///' | xargs)

cd manuais

cp ${MANUALS} ../build/shellinclude_${VERSION}_all/usr/share/man/man1

cd ../build

dpkg-deb -b shellinclude_${VERSION}_all
