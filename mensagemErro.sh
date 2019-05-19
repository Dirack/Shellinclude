#!/bin/bash
#
# mensagemErro.sh (Shell Script)
#
# Objetivo: Função para formatar a mensagem de erro dos programas
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




