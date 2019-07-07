#!/bin/bash
# 
# script.sh (Shell Script)
# 
# Objetivo: Listar todos os SConstruct associados a um paper da aba Reproducible Documents
# no site do Madagascar. No site, existem os papers com links para scripts SConstruct que
# servem para reproduzir os experimentos numéricos dos papers. Este script é um esboço para
# a construção de uma nova funcionalidade do programa getscons: Ser capaz de listar os scripts
# SConstruct disponíveis no site do Madagascar para que o usuário possa baixá-los sem abrir o
# navegador, apenas usando o terminal.
# 
# Site: http://www.dirackslounge.online
# 
# Versão 1.0
# 
# Programador: Rodolfo A. C. Neves 07/07/2019
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: Software de uso livre e código aberto.

# Baixar todos os links de papers reproduzíveis no site Madagascar
lynx --source http://www.ahay.org/wiki/Reproducible_Documents >> arquivo.html

# Os paper reproduzíveis estão nas linhas que contém class="external text"
sed -ni '/class="external text"/p' arquivo.html

# TODO elaborar melhor a lógica de filtragem a seguir para melhorar o desempenho
sed -i 's/[^.]*href="//g' arquivo.html # Apaga os caracteres html antes do link
sed -i 's/">/§/g' arquivo.html # O caractere § será o novo separador
sed -i 's/<[^>]*>//g' arquivo.html # Apaga caracteres html restantes
sed -ni '/paper_html/p' arquivo.html #Os paper reproduzíveis estão nas linhas que contém 'paper_html'

# Listar todos os links sobre 'diffraction'
grep -n 'diffraction' arquivo.html

# Listar todos os links para um paper_html fornecido. 
lynx -listonly -dump http://www.reproducibility.org/RSF/book/bei/sg/paper_html/ | sed -n '/html/p' | sed 's/ //g' | cut -d"." -f2- | uniq >> tmp.txt

# Busca nos links obtidos, aqueles que contém arquivos SConstruct
while read linha
do 

	lynx - -listonly -dump $linha | sed -n '/paper_html/!p' | sed -n '/.html$/p' | sed -n '/RSF\/book/p' | sed 's/ //g' | cut -d"." -f2- | uniq

	break

done < tmp.txt















