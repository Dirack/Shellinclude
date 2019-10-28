#!/bin/bash
#
# morse-1.0.sh (Shell Script)
# 
# Objetivo: Enviar email pelo terminal.
# 
# Versão 1.0
# 
# Site: http://www.dirackslounge.online
# 
# Programador: Rodolfo A. C. Neves (Dirack) 27/10/2019
# 
# Email: rodolfo_profissional@hotmail.com
# 
# Licença: Software de uso livre e código aberto.

PARA="rodolfo_profissional@hotmail.com"

DE="rodolfo_profissional@hotmail.com"

XPS="$1"

ASSUNTO="Teste"

MENSAGEM="
Olá,
Esta é uma mensagem de texto de teste.

$(pgrep -x scons)

Att.,
<b>Rodolfo Dirack</b>

"

MENSAGEM=$(echo "$MENSAGEM"| sed 's/$/<br>/')

## envie o arquivo por email
[ -n "$1" ] && sendemail -f \
"$DE" -t \
"$PARA" -o message-charset="utf-8" \
message-content-type="html" -u \
"$ASSUNTO" -m \
"$MENSAGEM" \
-s smtp-mail.outlook.com:587 -xu \
"$DE" -xp "$XPS"

if [ "$?" -eq "0" ]
then
	zenity --notification --text="Email enviado $(date +%H:%M:%S)"
else
	zenity --notification --text="Falha ao enviar email $(date +%H:%M:%S)"
fi			
