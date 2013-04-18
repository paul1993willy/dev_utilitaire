#!/bin/bash

################################################################################
#
#	Auteur : Paul-Willy Jean
#	Date : 4 avril 2013
#	Fichier : 1022680_tp1.bash
#
################################################################################

# Sauvegarde de mon Internal Field Separator
OLD_IFS=$IFS

# Je vais séparer des virgules
IFS=","

# Affiche un message d'erreur si aucun fichier ne peut être lu
if [[ $# != 2 || ! -r $2 ]]; then
	echo "Usage : $0 NOM_DU_GROUPE FICHIER_A_LIRE";
	exit
fi

# Rend mes variables de groupe et de fichier plus facile à identifier et me
# d'un set mal placé
groupe=$1;
fichier=$2;

declare -l ligne;

while read ligne; do
	# Traduction des virgules en underscore et retrait des accents
	ligne=$(echo ${ligne//,/_} | iconv -f utf8 -t ascii//TRANSLIT);

	# Place la ligne dans un tableau et retraduction des underscore en virgules
	compte=(${ligne//_/,});
done < $fichier
