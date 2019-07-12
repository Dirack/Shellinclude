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
	clear
	ESCALA=$(echo "\033[35m[$ESCALA]  $PORCENTAGEM_CONCLUIDA% \033[m")
	echo -ne "\033[80;1H$ESCALA\r"
	#echo ""

	[ "$PORCENTAGEM_CONCLUIDA" -lt "2" ] && return 0


	for k in $(seq "$NUMERO_PASSOS" -1 1)
	do

		PASSO="$PASSO""#"

	done

	echo -ne "\033[80;2H$PASSO\r"
	echo -ne "\033[1;1H\r"
	return 0

}





