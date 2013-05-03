#!/bin/bash

################################################################################
#
#	Auteur : Paul-Willy Jean
#	$date$
#	Fichier : 1022680_tp1.bash
#
################################################################################

function strip_accent ()
{
	# Retrait des accents et des espaces
	ligne=$(echo ${ligne//\ /} | iconv -f utf8 -t ascii//TRANSLIT)
}

function couper_ligne ()
{
	# Place la ligne dans un tableau
	compte=($(echo ${ligne} | cut --fields="1-" --delimiter="," --output-delimiter=" "));
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
	if [[ ${#compte[2]} -lt $char_prenom ]]; then
		char_prenom=${#compte[2]}
	fi

	# Reduit le nombre de caracteres de l'offset s'il est plus long que la chaine
	if [[ ${#compte[1]} -lt $char_nom_famille ]]; then
		char_nom_famille=${#compte[1]}
	fi

	# Trouve un nom au compte utilisateur
	user="${compte[2]:0:$char_prenom}${compte[1]:0:$char_nom_famille}"
	useradd --comment '${compte}' --gid ${groupe} --create-home --home ${groupe}/${user} --no-user-group 
	mot_de_passe=$(echo ${user} | sha1sum) && mot_de_passe=${mot_de_passe:0:8}
	echo ${mot_de_passe} | passwd --expire ${user}
	id ${user} > /dev/null 2>&1
	if [[ $? == 0 ]]; then
		echo "Votre compte a été créé. Votre nom d'utilisateur est ${user} et votre mot de passe est ${mot_de_passe}. Vous aurez à le changer à votre première connexion." | mail -s 'Votre compte a été créé.' ${user}
	fi
done < $fichier

