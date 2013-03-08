#!/bin/bash

# Vérifie la présence des paramètres requis
if [[ $# != 1 ]]; then
	echo "Usage : $0 FILE | DIRECTORY"
	exit 1
fi

fichier=$1

# Récupère le UID du propriétaire fichier ou du répertoire à vérifier
own=$(stat --format="%u" $fichier)

# Récupère les permission de l'utilisateur sur le fichier.

echo "Nom de l'utilisateur lançant le script : $USER"

if [[ $own == $UID ]]; then
	echo "\"$fichier\" appartient à $USER"
else
	echo "$fichier n'appartient pas à $USER"
fi

echo -n "Vous avez le droit de "

if [ -w $fichier ]; then
	echo -n "écriture"
fi

if [ -r $fichier ]; then
	if [ -w $fichier ]; then
		echo -n "/"
	fi
	echo -n "lecture"
fi

if [ -x $fichier ]; then
	if [ -w $fichier -o -r $fichier ]; then
		echo -n "/"
	fi
	echo -n "exécution"
fi

echo ""
