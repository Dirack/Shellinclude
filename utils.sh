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

#barraDeProgresso(){

	#set -xv

	TOTAL_ITERACOES="$1" # Valor que equivale a 100%
	ITERACAO_ATUAL="$2" # Valor atual

	PORCENTAGEM_CONCLUIDA=$((100*ITERACAO_ATUAL/TOTAL_ITERACOES))

	NUMERO_PASSOS=$((PORCENTAGEM_CONCLUIDA/2))

	#echo "$NUMERO_PASSOS"
	 
	#exit 0
	#clear

	ESCALA=".................................................."
	TAM=$(echo "${#ESCALA}")
	echo -ne "\033[35m[$ESCALA]  $PORCENTAGEM_CONCLUIDA% \033[m"

	#sleep 0.5
	#exit 0
	#[ $1 -le 520 ] && exit

	#i=`echo "$1/520" | bc`
	#perc=`echo "2*$i" | bc`

	for k in $(seq "$NUMERO_PASSOS" -1 1)
	do

	PASSO="$PASSO""#"

	done

	echo -e "\033[2G$PASSO"

#}






