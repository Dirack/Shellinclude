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

ARQUIVO="$2"

[ "$3" == "-m" -a -n "$4" ] && {
	OBJETIVO="$4"
}

case "$1" in
	-sh)
		buildShellScript "$ARQUIVO" "$OBJETIVO"
		exit 0
	;;

	-f90)
		buildFortran
		exit 0
	;;

	*)
		MENSAGEMERRO="Opção $1 Desconhecida!\nDigite $(basename $0) -h para obter ajuda"
		exibirMensagemErroProgramaFormatada "$(basename $0)" "4" "$MENSAGEMERRO"
	;;
esac


















