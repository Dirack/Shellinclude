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

TESTES = lipsum
DIR_TESTES = ./TDD
PROGRAMAS= backup cabecalho comp getscons img jonas lembrete lipsum madagainstall morse suinstall 
VERSAO="1.3.0"

install:
	@echo "Instalação das dependências e configuração do ambiente..."

test:	msg ambiente $(TESTES)

ambiente: 
	@echo "...Teste de ambiente e configuração" && $(DIR_TESTES)/ambiente_tdd.sh $(PWD)

versao:	$(PROGRAMAS)
	@echo "...Teste de versionamento: Versão $(VERSAO)" && $(DIR_TESTES)/versao_tdd.sh $(VERSAO) "$(PROGRAMAS)"
	
msg:
	@echo "Testando a biblioteca Shellinclude..."
	
%:	$(DIR_TESTES)/%_tdd.sh
	@echo "...Testando $@" && $<
