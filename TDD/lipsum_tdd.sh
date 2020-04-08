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

source $(dirname $0)/tdd_lib.sh

# Testar se lipsum exibe a quantidade de linhas pedidas corretamente
error "$(lipsum -r | wc -l)" "1" "1" "Exibir uma linha com lipsum -r"
error "$(lipsum -r 10 | wc -l)" "10" "2" "Exibir 10 linhas com lipsum -r 10"
