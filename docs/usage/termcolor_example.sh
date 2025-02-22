#!/bin/bash

source ../../src/termcolor

echo "Exemplo de uso da biblioteca termcolor"

echo "Usando as cores..."

e_red "Mensagem em vermelho"

e_green "Mensagem em verde"

e_yellow "Mensagem em amarelo"

e_blue "Mensagem em azul"

e_purple "Mensagem em roxo"

echo "Usando as formatações..."

e_header "Este é um título"
e_success "Sucesso"
e_error "Erro"
e_warning "Aviso"
e_underline "Texto sublinhado"
e_bold "Texto em negrito"
e_note "Anotação"