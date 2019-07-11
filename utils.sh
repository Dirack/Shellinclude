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

arquivoExiste(){

	local ARQUIVO="$1"

	[ -z "$ARQUIVO" ] && {
		return 0
	}

	if [ -f "$ARQUIVO" ]
	then
		return 1
	else
		return 0
	fi
}

diretorioExiste(){

	local DIRETORIO="$1"

	[ -z "$DIRETORIO" ] && {
		return 0
	}

	if [ -d "$DIRETORIO" ]
	then
		return 1
	else
		return 0
	fi
}






