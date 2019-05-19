#!/bin/bash
#
# mensagemAjuda.sh (Shell Script)
#
# Objetivo: Função para formatar a mensagem de ajuda dos programas
# da biblioteca shell script.
#
# Fornecer os parâmetros para a função 'exibirMensagemAjudaProgramaFormatada'
# da seguinte maneira:
#
#		$1 NOME DO PROGRAMA
#		$2 DESCRIÇÃO
#		$3 PARÂMETROS
#		$4 EXEMPLO DE USO
#
# Os parâmetros devem ser passados em uma variável em que cada linha é um parâmetro,
# separado de sua legenda explicativa por '::' como no exemplo abaixo:
#
# PARÂMETROS="-h --help:: Exibe esta mensagem de ajuda e sai
# 	      -v --version:: Exibe a versão do programa e sai
#	      -c:: Realiza alguma coisa"
#
# Exemplo de uso desta biblioteca:
#
#	~$ source mensagemAjuda.sh
#	~$ NOME_PROGRAMA="TESTE"
#	~$ DESCRICAO="Este é um teste"
#	~$ PARAMETROS="-h --help::Exibe ajuda e sai"
#	~$ EXEMPLO_DE_USO="Exemplo de teste"
#	~$ exibirMensagemAjudaProgramaFormatada "$NOME_PROGRAMA" "$DESCRICAO" "$PARAMETROS" "$EXEMPLO_DE_USO"
#
#	Saída esperada:
#
#		NOME
#			TESTE
#		DESCRIÇÃO
#			Este é um teste
#		PARÂMETROS
#			-h --help Exibe ajuda e sai
#		EXEMPLO DE USO
#			Exemplo de teste
#
# 
# Site: http://www.dirackslouge.online
#
# Versão 1.0
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

	TABELA_PARAMETROS=$(formatarTabelaParametros "$TABELA_PARAMETROS")

	

	MENSAGEM_AJUDA="
	\033[00;01mNOME\033[m
	\t$NOME_PROGRAMA [-h | -v | -c ]
	\033[00;01mDESCRIÇÃO\033[m
	\t$DESCRICAO
	\033[00;01mPARÂMETROS\033[m
	\t$TABELA_PARAMETROS
	\033[00;01mEXEMPLO DE USO\033[m
	\t$EXEMPLO_DE_USO
	"

	echo -e "$MENSAGEM_AJUDA"

	return 0
}




