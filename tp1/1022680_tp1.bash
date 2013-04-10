#!/bin/bash

################################################################################
#
#	Auteur : Paul-Willy Jean
#	Date : 4 avril 2013
#	Fichier : 1022680_tp1.bash
#
################################################################################

# Affiche un message d'erreur si aucun fichier ne peut être lu
if [[ $# != 1 || ! -r $1 ]]; then
	echo "Usage : $0 FICHIER_A_LIRE";
	exit
fi

while read ligne; do
	typeset -l ligne;
	
done > comptes.txt
