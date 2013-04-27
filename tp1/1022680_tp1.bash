#!/bin/bash

################################################################################
#
#	Auteur : Paul-Willy Jean
#	Date : 4 avril 2013
#	Fichier : 1022680_tp1.bash
#
################################################################################

function strip_accent ()
{
	# Retrait des accents et des espaces
	ligne=$(echo ${ligne// /} | iconv -f utf8 -t ascii//TRANSLIT);

	#
	# Test
	#
	# echo $ligne
}

function couper_ligne ()
{
	# Place la ligne dans un tableau
	compte=($(echo ${ligne} | cut --fields="1-" --delimiter="," --output-delimiter=" "));

	#
	# Test
	#
	# IFS=";"$IFS
	# echo "${compte[*]}"
}

# Affiche un message d'erreur si aucun fichier ne peut être lu
if [[ $# != 2 || ! -r $2 ]]; then
	echo "Usage : $0 NOM_DU_GROUPE FICHIER_A_LIRE";
	exit
fi

#
# Rend mes variables de groupe et de fichier plus facile à identifier et me protege
# d'un set mal placé
#
groupe=$1;
fichier=$2;

declare -l ligne;

while read ligne; do
	strip_accent;
	couper_ligne;
	char_nom_famille=5;
	char_prenom=2;

	#
    #	Pour choisir un nom d'utilisateur
	#
	while true; do
	#while [[ $(id $user 2> /dev/null | wc -l) == 0 ]]; do
		# Trouve un nom au compte utilisateur
		user="${compte[2]:0:$char_prenom}${compte[1]:0:$char_nom_famille}"

		# Ajoute un caractère au nom d'utilisateur jusqu'à ce qu'il soit unique
		if [[ $((${#compte[1]} - 1)) > $char_nom_famille ]]; then
			echo "Je suis ${compte[1]}, un nom de famille, j'ai ${#compte[1]} caracteres et suis coupe a $char_nom_famille";
			((char_nom_famille++));
		elif [[ $((${#compte[0]} - 1)) > $char_prenom ]]; then
			echo "Je suis ${compte[0]}, un prenom, j'ai ${#compte[2]} caracteres et suis coupe a $char_prenom";
			((char_prenom++));
		else
			echo "Je suis ${compte[*]} On a expire ma longueur totale";
			break;
		fi
	done
done < $fichier

