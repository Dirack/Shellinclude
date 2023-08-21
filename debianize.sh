#!/bin/bash

VERSION=$1

mkdir -p shellinclude_${VERSION}_all/DEBIAN

CONTROL="Package: shellinclude
Version: ${VERSION}
Architecture: all
Priority: optional
Essential: no
Maintainer: Rodolfo A C Neves (Dirack) <https://dirack.github.io>
Original-Maintainer: GPGEOF <https://github.com/gpgeof>
Bugs: https://github.com/Dirack/Shellinclude/issues/new?assignees=Dirack&labels=bug&template=bug_report.md&title=%5BBUG%5D
Homepage: https://github.com/Dirack/Shellinclude/wiki
Depends: bash
Description: Programas utilitários em Shell Script para auxiliar em tarefas do cotidiano no Linux Ubuntu
 A Shellinclude é uma biblioteca shell script com vários programas utilitários que ajudam a facilitar tarefas rotineiras do programador no sistema operacional Linux Ubuntu.
 Os scripts da Shellinclude também podem ser utilizados como templates para outros programadores desenvolverem os seus próprios programas.
 .
 Programas da versão atual - v0.1.0-beta.1 (Beta)
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

 echo "$CONTROL" > shellinclude_${VERSION}_all/DEBIAN/control

 mkdir -p shellinclude_${VERSION}_all/usr/bin

 cp cabecalho comp img jonas lipsum toolbox mensagemAjuda mensagemErro shellinclude_${VERSION}_all/usr/bin

 mv shellinclude_${VERSION}_all build

 cd build

 dpkg-deb -b shellinclude_${VERSION}_all
