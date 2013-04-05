#!/bin/bash

# S'assure de la présence des paramètres
if [[ $# != 2 ]]; then
	echo "Usage : $0 REPERTOIRE_SOURCE PREFIXE_DES_FICHIERS";
	exit;
fi

declare -r SEPARATEUR_EXTENTION='.';
repertoire_source=$1;
prefixe=$2;
compteur=1;

# S'assurce que le répertoire source soit un répertoire sur lequel
# l'utilisateur a des droits de lecture
if [[ ! -d $repertoire_source || ! -r $repertoire_source ]]; then
	echo "Veuillez indiquer un répertoire source valide";
	exit;
fi

for fichier in $(ls -1 $repertoire_source); do
	tableau_fichier=($(echo $fichier | sed "s/\./ /" ));
	mv $repertoire_source/$fichier $repertoire_source/$prefixe$compteur$SEPARATEUR_EXTENTION${tableau_fichier[1]};
	echo $compteur;
done;
