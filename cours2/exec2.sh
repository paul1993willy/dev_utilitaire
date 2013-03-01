#!/bin/bash

if [[ $# != 2 ]]; then
	echo "Usage: exec2.sh <chaine_1> <chaine_2>"
	exit 1
fi

if [[ $1 && $2 ]]; then
	if [[ $1 < $2 ]]; then
		echo "$1 est plus petit que $2"
	elif [[ $1 > $2 ]]; then
		echo "$1 est plus grand que $2"
	else [[ $1 == $2 ]]
		echo "$1 est égal à $2"
	fi
else
	echo "Vous avez entré une chaine vide"
fi

