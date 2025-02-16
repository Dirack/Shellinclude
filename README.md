
# Shellinclude
> Programas utilitários em Shell Script para me auxiliar em tarefas do cotidiano no linux ubuntu.

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![Build Status](https://travis-ci.com/Dirack/Shellinclude.svg?branch=master)](https://travis-ci.com/Dirack/Shellinclude)

<img src="https://github.com/Dirack/Shellinclude/blob/master/res/superuser-superhero.jpg" width="200">

Os programas da Shellinclude representam a caixa de ferramentas para o programador. 
Estes scripts ajudam a realizar tarefas rotineiras, como escrever um cabeçalho padronizado para os arquivos fonte dos programas em diferentes linguagens de programação, 
gerar texto aleatório e etc.

Os scripts da Shellinclude também podem ser utilizados como templates por outros programadores,
pois a sua interface é facilmente adaptável e pode ser reutilizada para o 
desenvolvimento em Shell Script alterando as opções e flags dos programas.

[Para mais informações visite o nosso wiki!](https://github.com/Dirack/Shellinclude/wiki)

## Instalação

Para instalar a Shellinclude basta fornecer permissão de execução aos scripts com _chmod_, assim:

```shell
chmod +x script.sh
```

E você poderá chamar os scripts como qualquer outro Shell Script, fornecendo o caminho para o script ao
terminal do bash. Exemplo, executando um script do shell em um diretório qualquer:

```sh
/diretorio/script.sh
```

Se o script estiver no diretório atual, basta utilizar o ponto:

```sh
./script.sh
```

Você também pode chamar os scripts da Shellinclude como se fosse um comando nativo do _bash_. Basta adicionar os scripts
a um diretório listado na sua variável de ambiente $PATH ou adicionar a seguinte linha ao final do seu arquivo '$HOME/.bashrc':

```shell
PATH="$PATH:/caminhoParaShellinclude/Shellinclude"
```

## Dependências: 

* **Madagascar**: Pacote de processamento símico open source. Necessário para os programas _img_ e _comp_.

## Instalação das dependências

Para mais detalhes sobre a instalação do pacote Madagascar, consulte a página oficial do pacote em [ahay.org](http://www.ahay.org/wiki/Installation).

## Lista de Programas

* **lipsum**: Programa para gerar texto aleatório (dummy text) no terminal.
* **cabecalho**: Gerar o cabeçalho para um arquivo de programa de uma determinada linguagem de programação com objetivo, nome do programa, programador e etc.
* **comp**: Compilar e adicionar programas escritos em linguagem C à versão local do pacote de processamento sísmico MADAGASCAR.
* **img**: Converter arquivos .vpl (arquivos de imagem do MADAGASCAR) em imagens .jpeg
* **jonas**: Criar atalhos para pastas e aliases permanentes. Os aliases ficarão armazenados no arquivo $'HOME/.bash_aliases'.  

## Exemplos de uso

Alguns exemplos interessantes e úteis sobre como este projeto pode ser utilizado estão disponíveis em nosso
_[Wiki](https://github.com/Dirack/Shellinclude/wiki)._ 

## Histórico de lançamentos

* [v0.1.0-beta.1](https://github.com/Dirack/Shellinclude/releases/tag/v0.1.0-beta.1)

[Visualize o histórico de modificações detalhado](https://github.com/Dirack/Shellinclude/wiki/Hist%C3%B3rico-de-vers%C3%B5es)

## Sobre

Rodolfo Dirack – [@dirack](https://github.com/Dirack) – rodolfo_profissional@hotmail.com

Distribuído sob a licença GPL3. Veja `LICENSE` para mais informações.

[Shellinclude main page](https://github.com/Dirack/Shellinclude)

## Contribuição

1. Faça o _fork_ do projeto (<https://github.com/Dirack/Shellinclude/fork>)
2. Crie uma _branch_ para sua modificação (`git checkout -b feature/suaFeature`)
3. Faça o _commit_ (`git commit -am 'Add some fooBar'`)
4. _Push_ (`git push origin feature/fooBar`)
5. Crie um novo _Pull Request_

[Para uma explicação detalhada, visite a página Contribua do nosso wiki](https://github.com/Dirack/Shellinclude/wiki/Contribua)

#### Importante: O histórico de suas modificações deve ser claro, com mensagens de commit de um a dois parágrafos descrevendo cada modificação. _Pull Requests_ com histórico de commits insuficiente serão rejeitados.
