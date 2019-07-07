#!/bin/bash
#
# searchScons_lib.sh (Shell Script)
# 
# Objetivo: Funções para atualizar o banco de dados de links dos papers do Madagascar.
# 
# Versão 1.0
# 
# Site: http://www.dirackslounge.online
# 
# Programador: Rodolfo A. C. Neves (Dirack) 07/07/2019
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: Software de uso livre e código aberto.

SITE_MADAGASCAR="http://www.ahay.org/wiki/Reproducible_Documents"

# Baixar todos os links de papers reproduzíveis no site Madagascar
# e armazenar em um arquivo txt fornecido
updateListaScons(){

	TMP="$1"

	echo "Atualizando listagem dos papers do MADAGASCAR em $TMP..."

	# Baixar lista de links
	lynx --source $SITE_MADAGASCAR | sed -n '/class="external text"/p' | sed -n '/paper_html/p' > "$TMP"

	# Limpar caracteres HTML
	sed -i 's/[^.]*href="//g;s/">/§/g;s/<[^>]*>//g' "$TMP"

}
