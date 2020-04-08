#!/bin/bash
#
# versao_tdd.sh (Shell Script)
# 
# Objetivo: Testes de versionamento da biblioteca.
# 
# Site: https://dirack.github.io
# 
# Versão 1.3.0
# 
# Programador: Rodolfo A C Neves (Dirack) 02/04/2020
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

source $(dirname $0)/tdd_lib.sh

VERSAO="$1"
LISTA="$2"

# Testar se os programas exibem a versão correta da biblioteca Shellinclude
for PROGRAMA in $LISTA
do
	error "$($PROGRAMA -v)" "Shellinclude - $VERSAO" "1" "Teste de versionamento do programa $PROGRAMA"
	error "$($PROGRAMA --version)" "Shellinclude - $VERSAO" "2" "Teste de versionamento do programa $PROGRAMA"
	#VAR=$(grep -xq "# Versão $VERSAO" "$PROGRAMA")
	#error "$?" "0" "3" "Teste versionamento do cabeçalho do código fonte de $PROGRAMA"
done
