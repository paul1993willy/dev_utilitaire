#!/bin/bash

declare -i valeur=0

echo -n "Veuillez entrer une valeur : "

read valeur

if [ $(($valeur % 2)) == 0 ] ; then
	echo "Ce nombre est pair."
else
	echo "Ce nombre est impair."
fi
