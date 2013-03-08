#!/bin/bash

for Jour in Dimanche Lundi Mardi Mercredi Jeudi Vendredi Samedi; do
	echo $Jour	# Chaque jour sur une ligne separee
done

for fichier in $(ls $1); do
	echo -e "$fichier | Appartient a $(stat -c \"%U\" $1/$fichier)\n "
done

declare -a tableau=( zero un deux )
for element in ${tableau[@]}; do
	echo -e "Element est $element \n"
done

variable="Debian Ubuntu CentOs Solaris RedHat"
set -- $variable

for i; do
	echo $i
done

for (( i = 0; i < 3; i++ ))
do
	echo "Element [$i] : ${tableau1[$1]}"
done
