#!/bin/bash
#
# mensagemErro.sh (Shell Script)
#
# Objetivo: Função para formatar a mensagem de erro dos programas
# da biblioteca shell script.
#
# Para uma descrição mais detalhada desta biblioteca, consulte:
# https://github.com/Dirack/Shellinclude/wiki/mensagemErro.sh
# 
# Site: http://www.dirackslouge.online
#
# Versão 1.1
#
# Programador: Rodolfo A. C. Neves 19/05/2019 
# 
# email (manutenção): rodolfo_profissional@hotmail.com
# 
# Licença: Software de uso livre e código aberto.

exibirMensagemErroProgramaFormatada(){

	NOME_PROGRAMA="$1"
	NUMERO_ERRO="$2"
	MENSAGEM_ERRO="$3"

	echo -e "\033[31m$NOME_PROGRAMA: ERRO($NUMERO_ERRO):  $MENSAGEM_ERRO\033[m"

	exit "$NUMERO_ERRO"
}




