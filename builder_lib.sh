#!/bin/bash
#
# builder_lib.sh (Shell Script)
# 
# Objetivo: Biblioteca de funções do programa builder.
# 
# Site: http://www.dirackslounge.online
# 
# Versão 1.0
# 
# Programador: Rodolfo Dirack 27/07/2019
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

buildShellScript(){

	local ARQUIVO="$1"
	local OBJETIVO="$2"

	./cabecalho -sh "$ARQUIVO" -m "$OBJETIVO"
	cat .template/shellScript.temp >> "$ARQUIVO" 

	return 0

}

buildFortran(){

	local ARQUIVO=$(echo "$ARQUIVO" | cut -d"." -f1)
	local OBJETIVO="$2"

	local MODULO=$(echo "$ARQUIVO" | cut -d"." -f1)
	MODULO="${MODULO}_lib.f90"
	ARQUIVO="${ARQUIVO}.f90"
	TMP="${ARQUIVO}_tmp.bd"
	TMPMOD="${MODULO}_tmp.bd"
	TMPMAKE="${ARQUIVO}_make_tmp.bd"

	./cabecalho -f90 "$TMP" -m "$OBJETIVO"
	sed -n '1,/IMPLICIT NONE/p' "$TMP" >> "$ARQUIVO"
	cat .template/fortran.temp >> "$ARQUIVO"

	./cabecalho -mf90 "$TMPMOD" -m "$OBJETIVO"
	sed -n '1,/IMPLICIT NONE/p' "$TMP" >> "${MODULO}"
	cat .template/fortran_mod.temp >> "${MODULO}"

	./cabecalho -sh "$TMPMAKE" -m "$OBJETIVO"
	sed -i 's/(Shell Script)//' "$TMPMAKE"
	cat .template/makefile.temp >> "$TMPMAKE"
	cp "$TMPMAKE" "$(dirname $ARQUIVO)/Makefile"

	rm "$TMP" "$TMPMOD" "$TMPMAKE"

	return 0

}











