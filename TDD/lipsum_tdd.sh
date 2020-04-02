#!/bin/bash
#
# lipsum_tdd.sh (Shell Script)
# 
# Objetivo: Testes do programa lipsum.
# 
# Site: https://dirack.github.io
# 
# Versão 1.3
# 
# Programador: Rodolfo A C Neves (Dirack) 02/04/2020
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

error(){

	[ "$1" != "$2" ] && {
		echo "$(basename $0): ERRO($3): Teste falhou, resultado esperado $2"
		exit 1
	}

	return 0
}

# Testar se lipsum exibe a quantidade de linhas pedidas corretamente
error "$(lipsum -r | wc -l)" "1" "1"
error "$(lipsum -r 10 | wc -l)" "10" "2"
