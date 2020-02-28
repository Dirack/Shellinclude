#!/bin/bash
#
# mensagemAjuda.sh (Shell Script)
#
# Objetivo: Função para formatar a mensagem de ajuda dos programas
# da biblioteca shell script.
#
# Para uma descrição mais detalhada desta biblioteca, consulte:
# https://github.com/Dirack/Shellinclude/wiki/mensagemAjuda.sh
# 
# Site: http://www.dirackslouge.online
#
# Versão 1.1
#
# Programador: Rodolfo A. C. Neves 18/05/2019 
# 
# email (manutenção): rodolfo_profissional@hotmail.com
# 
# Licença: Software de uso livre e código aberto.

formatarTabelaParametros(){

	
	TABELA_PARAMETROS_FORMATADA=$(echo "$1" | sed 's/^/\\t\\033[00;01m/' | sed 's/::/ \\033[m/' )

	echo "$TABELA_PARAMETROS_FORMATADA"

}

exibirMensagemAjudaProgramaFormatada(){

	NOME_PROGRAMA="$1"
	DESCRICAO="$2"
	TABELA_PARAMETROS="$3"
	EXEMPLO_DE_USO="$4"

	#set -xv

	LISTA_OPCOES=$(echo "$TABELA_PARAMETROS" | cut -d" " -f1 | sed 's/^/ /' | sed 's/$/ /' | paste -s -d"|")

	#exit 0

	TABELA_PARAMETROS=$(formatarTabelaParametros "$TABELA_PARAMETROS")	

MENSAGEM_AJUDA="\033[00;01mNOME\033[m
\t$NOME_PROGRAMA [$LISTA_OPCOES]
\033[00;01mDESCRIÇÃO\033[m
\t$DESCRICAO
\033[00;01mPARÂMETROS\033[m
$TABELA_PARAMETROS
\033[00;01mEXEMPLO DE USO\033[m
\t$EXEMPLO_DE_USO
"

	echo -e "$MENSAGEM_AJUDA"

	return 0
}




