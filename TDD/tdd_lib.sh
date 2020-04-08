#!/bin/bash
#
# tdd_lib.sh (Shell Script)
# 
# Objetivo: Biblioteca das funções de teste automatizado.
# 
# Site: https://dirack.github.io
# 
# Versão 1.0
# 
# Programador: Rodolfo A C Neves (Dirack) 02/04/2020
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

error(){
# $1 - Resultado do teste
# $2 - Resultado esperado do teste
# $3 - Número do erro (Para identificar qual teste falhou)
# $4 - Descrição do teste

	echo -en "\t$4"

	[ "$1" != "$2" ] && {
		echo -e "\033[35m $(basename $0): ERRO($3): Teste falhou. \033[m"
		echo -e " \033[35mResultado esperado: $2\nResultado obtido: $1 \033[m"
		exit "$3"
	}

	echo " ...passou $3"

	return 0
}

verificaInstalacao(){
	
	LISTA="$1"
	PASTA="$2"

	for i in $LISTA
	do
		echo -en "\t\t$i..."
		[ ! -f "$PASTA/$i" ] && {
			echo "...$i não encontrado!"
			return 1
		}

		echo "...Ok"
	done

	return 0
}
