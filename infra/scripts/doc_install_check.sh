#!/bin/bash

for doc in "$(ls docs/*.1)"
do
    doc=${doc##*\/}
    doc=${doc%%.*}
    man -f "$doc"
    subject=$(echo $?)
    man -w "$doc"
    docfile=$(echo $?)
	if [ "$docfile" -ne 0 -o "$subject" -ne 0 ]
    then
		echo "ERROR: Documentation ${doc} not found!"
		exit 1
	fi
	echo "Documentation checked: ${doc} file"
done