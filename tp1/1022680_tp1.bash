#!/bin/bash

################################################################################
#
#	Auteur : Paul-Willy Jean
#	Date : 4 avril 2013
#	Fichier : 1022680_tp1.bash
#
################################################################################

# Affiche un message d'erreur si aucun fichier ne peut être lu
if [[ $# != 2 || ! -r $2 ]]; then
	echo "Usage : $0 NOM_DU_GROUPE FICHIER_A_LIRE";
	exit
fi

#
# Rend mes variables de groupe et de fichier plus facile à identifier et me
# d'un set mal placé
#
groupe=$1;
fichier=$2;

declare -l ligne;

while read ligne; do
	# Retrait des accents et des espaces
	ligne=$(echo ${ligne// /} | iconv -f utf8 -t ascii//TRANSLIT);

	# Place la ligne dans un tableau
	compte=($(echo ${ligne} | cut --fields="1-" --delimiter="," --output-delimiter=" "));

	char_nom_famille=5;
	char_prenom=2;

	#
    #	Pour choisir un nom d'utilisateur
	#
	while true; do
	#while [[ $(id $user 2> /dev/null | wc -l) == 0 ]]; do
		# Trouve un nom au compte utilisateur
		user="${compte[2]:0:$char_prenom}${compte[1]:0:$char_nom_famille}"

		echo "USER: ${user}, FIRST_NAME: ${compte[2]}, LAST_NAME: ${compte[1]}";

		# Ajoute un caractère au nom d'utilisateur jusqu'à ce qu'il soit unique
		if [[ $((${#compte[1]} - 1)) > $char_nom_famille ]]; then
			((char_nom_famille++));
		elif [[ $((${#compte[2]} - 1)) > $char_prenom ]]; then
			((char_prenom++));
		else
			break;
		fi
	done
done < $fichier
