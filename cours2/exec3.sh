#!/bin/bash

if [[ $# != 1 ]]; then
	echo "$0 FILE"
	exit 1
fi

if [ -f $1 ]; then
	echo "$1 est un fichier régulier"
elif [ -d $1 ]; then
	echo "$1 est un répertoire"
elif [ ! -e $1 ]; then
	echo "$1 n'existe pas"
fi
