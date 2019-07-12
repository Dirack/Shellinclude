#!/bin/bash

source ./utils.sh

#set -xv
for i in $(seq 1 1 100)
do
	echo -e "$i\n"
	barraDeProgresso 100 "$i"
	sleep 0.2
done
