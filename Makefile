# Makefile
# 
# Objetivo: Testes da biblioteca Shellinclude no travis CI.
# 
# Site: https://dirack.github.io
# 
# Versão 1.3
# 
# Programador: Rodolfo A C Neves (Dirack) 02/04/2020
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>.

install:
	echo "Instalação das dependências"
	pwd
	ls
	ls /

test:
	@echo "Testando a biblioteca Shellinclude..."
	@echo "...Testando lipsum" && ./TDD/lipsum_tdd.sh
