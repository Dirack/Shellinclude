#!/bin/bash
#
# builder (Shell Script)
# 
# Objetivo: Construir pacotes de arquivos fonte preparados para programação.
#
# 	- Depende do programa 'cabecalho'.
# 
# Site: http://www.dirackslounge.online
# 
# Versão 1.0
# 
# Programador: Rodolfo Dirack 27/07/2019
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

# Biblioteca de funções para formatar a mensagem de ajuda
source mensagemAjuda.sh 

# Biblioteca de funções para formatar a mensagem de erro
source mensagemErro.sh

# Biblioteca de funções para construir arquivos com o programa builder
# Módulo simples para programas sem dependências
source builder_lib.sh

## Verificar se o usuário forneceu $1 e $2
if [ -z "$1" ]
then
	MENSAGEMERRO="Usuário não ofereceu parâmetros ao programa!\nDigite $(basename $0) -h para obter ajuda!"
	exibirMensagemErroProgramaFormatada "$(basename $0)" "1" "$MENSAGEMERRO"
fi

# Versão deste programa
VERSAO="Versão 1.0"

## Variáveis que armazenam mensagem de ajuda do programa
NOME_PROGRAMA="$(basename $0)"
DESCRICAO="Construir pacotes de arquivos fonte preparados para programação para várias linguagens."
PARAMETROS="-h --help::Exibe essa tela de ajuda e sai
-v --version::Exibe a versão do programa e sai
-sh ::Cabeçalho para um programa em shell script
-java :: Pacote Java
-php :: Script PHP
-html-php :: Página HTML com PHP
-m <objetivo>::Fornecer o Objetivo ao cabeçalho do arquivo"
EXEMPLO_DE_USO="~$ $(basename $0) -sh Arquivo.sh # Pacote Shell Script para Arquivo.sh
\t~$ $(basename $0) -sh Arquivo.sh -m <objetivo> # Adiciona o <objetivo> as descrições do arquivo"

case "$1" in
	-h | --help) ## Exibe a ajuda
		clear
		exibirMensagemAjudaProgramaFormatada "$NOME_PROGRAMA" "$DESCRICAO" "$PARAMETROS" "$EXEMPLO_DE_USO"
		exit 0
	;;

	-v | --version) ## Exibe a versão do programa
		echo "$VERSAO"
		exit 0
	;;
esac

# Usuário forneceu um nome para o arquivo a ser criado?
[ -z "$2" ] && {
	MENSAGEMERRO="Usuário não ofereceu o nome do arquivo!\nDigite $(basename $0) -h para obter ajuda"
	exibirMensagemErroProgramaFormatada "$(basename $0)" "2" "$MENSAGEMERRO"
}

# Usuário forneceu um nome para o arquivo a ser criado?
[ -z "$3" -a -z "$4" ] && {
	MENSAGEMERRO="Usuário não ofereceu uma descrição ao arquivo após o parâmetro -m!\nDigite $(basename $0) -h para obter ajuda"
	exibirMensagemErroProgramaFormatada "$(basename $0)" "3" "$MENSAGEMERRO"
}

[ "$3" != "-m" ] && {
	MENSAGEMERRO="Sintaxe incorreta do parâmetro -m!\nDigite $(basename $0) -h para obter ajuda"
	exibirMensagemErroProgramaFormatada "$(basename $0)" "4" "$MENSAGEMERRO"
}

ARQUIVO_PRINCIPAL="$2"

[ "$3" == "-m" -a -n "$4" ] && {
	OBJETIVO="$4"
}

case "$1" in
	-sh)
		buildShellScript "$ARQUIVO_PRINCIPAL" "$OBJETIVO"
		exit 0
	;;

	-f90)
		buildFortran "$ARQUIVO_PRINCIPAL" "$OBJETIVO"
		FAZERMAKEFILE="1"
		COMPILADOR="gfortran"
		EXT=".f90"
		EXT_OBJ=".o"
		EXT_BIN=".x"
		CO='$(CC) -c $<'
		CBIN='$(CC) $(DEP) -o $@'
		RUN="$(dirname $ARQUIVO_PRINCIPAL)\/$<"
	;;

	-java)

		ARQUIVO_PRINCIPAL=$(echo "$ARQUIVO_PRINCIPAL" | cut -d"." -f1)
		ARQUIVO="${ARQUIVO}.java"

		buildJava "$ARQUIVO_PRINCIPAL" "$OBJETIVO"
		FAZERMAKEFILE="1"
		COMPILADOR="javac"
		EXT=".java"
		EXT_OBJ=".class"
		EXT_BIN=".class"
		CO='§null§'
		CBIN='$(CC) $<'
		RUN='java $(MAIN:.class=)'
	;;

	*)
		MENSAGEMERRO="Opção $1 Desconhecida!\nDigite $(basename $0) -h para obter ajuda"
		exibirMensagemErroProgramaFormatada "$(basename $0)" "5" "$MENSAGEMERRO"
	;;
esac

[ -z "$FAZERMAKEFILE" ] && {
	exit 0
}

[ "$#" -le "4" ] && {

	buildSimpleMakefile "$ARQUIVO_PRINCIPAL" "$OBJETIVO" "$COMPILADOR" "$EXT" "$EXT_OBJ" "$EXT_BIN" "$CO" "$CBIN" "$RUN"
	exit 0	

}















