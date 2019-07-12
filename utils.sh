#!/bin/bash
#
# utils.sh (Shell Script)
# 
# Objetivo: Biblioteca de funções utilitárias em Shell Sccript.
# 
# Site: http://www.dirackslounge.online
# 
# Versão 1.0
# 
# Programador: Rodolfo Dirack 11/07/2019
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

export VAR="ON"

barraDeProgresso(){

	[ "$#" -lt "2" ] && {
		echo "ERRO: A função depende de no mínimo 2 parâmetros!"
		exit 1
	}

	[ "$1" -lt "$2" ] && {
		echo "ERRO: O número total de iterações não pode ser menor que a iteração atual!"
		exit 2
	}

	local TOTAL_ITERACOES="$1"
	local ITERACAO_ATUAL="$2"
	local PORCENTAGEM_CONCLUIDA=$((100*ITERACAO_ATUAL/TOTAL_ITERACOES))
	local NUMERO_PASSOS=$((PORCENTAGEM_CONCLUIDA/2))
	local PASSO=""

	local ESCALA=".................................................."

	ESCALA=$(echo "\033[32m|$ESCALA|  $PORCENTAGEM_CONCLUIDA% \033[m")
	echo -ne "\033[s\033[1B$ESCALA\033[u"

	[ "$PORCENTAGEM_CONCLUIDA" -lt "2" ] && return 0


	for k in $(seq "$NUMERO_PASSOS" -1 1)
	do

		PASSO="$PASSO""▇"

	done

	echo -ne "\033[s\033[1B\033[2G\033[32m$PASSO\033[m\033[u"
	return 0

}

carregandoON(){
	carregando &
	CHAVETMPCARREG=$(echo "$!")
	return 0
}

carregandoOFF(){
	kill -9 "$CHAVETMPCARREG"
	return 0
}

carregando(){

	PASSO=""
	i="0"
	
	while :
	do
		i=$((i+1))
		PASSO="$PASSO""."
		echo -ne "\033[s\033[2B\033[1G\033[00;01;32mCARREGANDO${PASSO}\033[m\033[u"
		sleep 0.5
		[ "$i" -gt "4" ] && {
			echo -ne "\033[s\033[2B\033[1G\033[00;01;32mCARREGANDO     \033[m\033[u"
			PASSO=""
			i="0"
		}
	done
}





