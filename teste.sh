#!/bin/bash
#
# teste.sh (Shell Script)
# 
# Objetivo: Teste da função barraDeProgresso da biblioteca 'utils.sh'.
# 
# Site: http://www.dirackslounge.online
# 
# Versão 1.0
# 
# Programador: Rodolfo Dirack 12/07/2019
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

source ./utils.sh

	echo "instakdbipe;...."
	echo "jdjvldfipwnf"
	echo "testabfovnsd..."
	echo "Descompactando arquivo txgv...."

for i in $(seq 1 1 100)
do
	barraDeProgresso 100 "$i" &
	sleep 0.2
done
