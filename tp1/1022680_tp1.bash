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

	# Reduit le nombre de caracteres de l'offset s'il est plus long que la chaine
	if [[ ${#compte[2]} < $char_prenom ]]; then
		char_prenom=${#compte[2]}
		echo -n "${#compte[2]};"
		echo -n "${compte[2]};"
		echo $char_prenom
	fi

	# Reduit le nombre de caracteres de l'offset s'il est plus long que la chaine
	if [[ ${#compte[1]} < $char_nom_famille ]]; then
		char_nom_famille=${#compte[1]}
		echo -n "${#compte[1]};"
		echo -n "${compte[1]};"
		echo $char_nom_famille
	fi

	# Trouve un nom au compte utilisateur
	user="${compte[2]:0:$char_prenom}${compte[1]:0:$char_nom_famille}"
	echo $user
done < $fichier

