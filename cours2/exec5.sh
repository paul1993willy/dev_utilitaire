#!/bin/bash

# Vérifie la présence des paramètres requis
if [[ $# != 1 ]]; then
	echo "Usage : $0 FILE | DIRECTORY"
	exit 1
fi

# Récupère le UID du propriétaire fichier ou du répertoire à vérifier
own=$(stat --format="%u" $1)

# Récupère les permission de l'utilisateur sur le fichier.

echo "Nom de l'utilisateur lançant le script : $USER"

if [[ $own == $UID ]]; then
	echo "$1 appartient à $USER"
else
	echo "$1 n'appartient pas à $USER"
fi

echo -n "Vous avez le droit de "
