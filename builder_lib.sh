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

	$(dirname $0)/cabecalho -sh "$ARQUIVO" -m "$OBJETIVO"
	cat $(dirname $0)/.template/shellScript.temp >> "$ARQUIVO" 

	return 0

}

buildFortran(){

	local ARQUIVO=$(echo "$1" | cut -d"." -f1)
	local OBJETIVO="$2"

	ARQUIVO="${ARQUIVO}.f90"

	$(dirname $0)/cabecalho -f90 "$ARQUIVO" -m "$OBJETIVO"
	cat $(dirname $0)/.template/fortran.temp >> "$ARQUIVO"

	return 0
}

buildJava(){

	# TODO no nome da classe a primeira letra tem que ser maiúscula

	local ARQUIVO=$(echo "$1" | cut -d"." -f1)
	local OBJETIVO="$2"

	CLASS="$ARQUIVO"
	ARQUIVO="${ARQUIVO}.java"

	$(dirname $0)/cabecalho -java "$ARQUIVO" -m "$OBJETIVO"
	cat $(dirname $0)/.template/java.temp >> "$ARQUIVO"
	sed -i "s/§main§/$CLASS/" "$ARQUIVO"

	return 0
}

buildSimpleMakefile(){

	ARQUIVO_PRINCIPAL="$1"
	DIRETORIO="$(dirname $ARQUIVO_PRINCIPAL)"
	MAKEFILE="$DIRETORIO/Makefile"
	OBJETIVO="$2"
	COMPILADOR="$3"
	EXTENSAO="$4"
	EXTENSAO_OBJETO="$5"
	EXTENSAO_BINARIO="$6"
	COMANDO_OBJETO="$7"
	COMANDO_BINARIO="$8"
	COMANDO_RUN="$9"

	$(dirname $0)/cabecalho -sh "$MAKEFILE" -m "$OBJETIVO"
	cat $(dirname $0)/.template/makefile.temp >> "$MAKEFILE"
	sed -i '1d' "$MAKEFILE"
	sed -i "s/^.*(Shell Script).*$/# MAKEFILE/" "$MAKEFILE"
	sed -i "s/§main§/${ARQUIVO_PRINCIPAL}${EXTENSAO}/" "$MAKEFILE"
	sed -i "s/§compilador§/$COMPILADOR/" "$MAKEFILE"
	sed -i "s/§extensao§/$EXTENSAO/" "$MAKEFILE"

	if [ "$EXTENSAO_OBJETO" == "§null§" -o "$COMANDO_OBJETO" == "§null§" ] 
	then
		sed -i '/§extensaoObjeto§:/d' "$MAKEFILE"
		sed -i "s/§extensaoObjeto§/$EXTENSAO_OBJETO/" "$MAKEFILE"
		sed -i '/§compilacaoObjeto§/d' "$MAKEFILE"
		#sed -i "/MAIN/s/§extensaoBinario§//" "$MAKEFILE"
		
	else
		sed -i "s/§extensaoObjeto§/$EXTENSAO_OBJETO/" "$MAKEFILE"
		sed -i "s/§compilacaoObjeto§/$COMANDO_OBJETO/" "$MAKEFILE"
		sed -i "s/§extensaoBinario§/$EXTENSAO_BINARIO/" "$MAKEFILE"
	fi

	sed -i "s/§extensaoBinario§/$EXTENSAO_BINARIO/" "$MAKEFILE"
	sed -i "s/§compilacaoBinario§/$COMANDO_BINARIO/" "$MAKEFILE"
	sed -i "s/§run§/$COMANDO_RUN/" "$MAKEFILE"

	return 0
	
}











