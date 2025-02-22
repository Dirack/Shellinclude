#!/bin/bash

if [ -z "$1" ]
then
	echo "ERRO: Deve oferecer uma versão a atualizar!"
    echo "Exemplo: $(basename $0) 0.1.0"
	exit 1
fi

cd ../../src

for prog in $(ls *)
do
    sed -i "s/^VERSAO=.*$/VERSAO=\"Versão $1\"/" $prog
done

echo "Versões de scripts atualizadas para $1"

cd ../docs

for prog in $(ls *.1)
do
    sed -i "s/Versão [0-9]\.[0-9]\.[0-9]/Versão $1/" $prog
done

echo "Versões de documentação atualizadas para $1"