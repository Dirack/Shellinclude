#!/bin/bash
#
# morse.sh (Shell Script)
# 
# Objetivo: Enviar email pelo terminal.
# 
# Versão 2.0
# 
# Site: http://www.dirackslounge.online
# 
# Programador: Rodolfo A. C. Neves (Dirack) 27/10/2019
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: Software de uso livre e código aberto.

BACKTITLE="MORSE 2.0"
TITLE="ENVIAR EMAIL"
TMP="$(mktemp)"
TMP2="$(mktemp)"
ERROR_FILE="$(mktemp)"
trap  INTERRUPT SIGINT SIGTERM EXIT

INTERRUPT(){
	rm -f $TMP $TMP2 $ERROR_FILE
	exit 1
}

PARA=$(dialog --stdout --backtitle "$BACKTITLE" --title "$TITLE" --inputbox "Email destino: " 0 0 )
[ $? -ne 0 ] && exit

DE=$(dialog --stdout --backtitle "$BACKTITLE" --title "$TITLE" --inputbox "Email origem: " 0 0 )
[ $? -ne 0 ] && exit

SENHA=$(dialog --stdout --backtitle "$BACKTITLE" --insecure --title "$TITLE" --passwordbox "Senha: " 0 0 )
[ $? -ne 0 ] && exit

ASSUNTO=$(dialog --stdout --backtitle "$BACKTITLE" --title "$TITLE" --inputbox "Assunto: " 0 0)
[ $? -ne 0 ] && exit

cat << EOF > "$TMP"



# Esta é uma mensagem de email que vc pode editar
# Todas as linhas iniciadas com '#' serão ignoradas
# DE: $DE
# PARA: $PARA
# ASSUNTO: $ASSUNTO

EOF

dialog --title "MENSAGEM - CORPO DO EMAIL" \
	--backtitle "$BACKTITLE" \
	--fixed-font "$@" --editbox "$TMP" 0 0 2> "$TMP2"

MENSAGEM="$(cat $TMP2 | sed -n '/^#/! p' | sed 's/$/<br>/' )"

## envie o arquivo por email
sendemail -f \
"$DE" -t \
"$PARA" -o message-charset="utf-8" \
message-content-type="html" -u \
"$ASSUNTO" -m \
"$MENSAGEM" \
-s smtp-mail.outlook.com:587 -xu \
"$DE" -xp "$SENHA" > "$ERROR_FILE" 2>&1

if [ "$?" -eq "0" ]
then
	dialog --title "Morse 2.0" --msgbox "Email enviado com sucesso!" 0 0
else
	dialog --title "Morse 2.0 - ERRO AO ENVIAR EMAIL" --msgbox "Erro: \n$(cat $ERROR_FILE)" 0 0
fi			
