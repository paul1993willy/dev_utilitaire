#!/bin/bash

if [ $# -lt 3 ]
then
	echo "Syntaxe d'appel : $0 chaine debut fin"
	exit 1
fi
chaine=$1
echo ${chaine:$2:$3}
exit 0
