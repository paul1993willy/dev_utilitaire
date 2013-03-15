#!/bin/bash
# Illustration de IFS et tabs
clear

tabs 7,60 

declare -a fichier

case $1 in

        space)    IFS=$' '
                ;;

        tab)       IFS=$'\t'
                ;;

        return)    IFS=$'\n'
                ;;

        *)
                ;;

esac

fichier=($(cat /home/infs45/semaine2/etudiants.txt))

echo
echo -e "NB de tokens dans la variable fichier : "${#fichier[@]}
echo


for ((element=0 ; element < ${#fichier[@]} ; element++)) ; do \

       echo -n " # "$(($element+1))$'\t'

       echo  ${fichier[$element]}$'\t'"La deuxième tabulation !"

done


# affichage de la valeur de IFS
echo
echo -n "$IFS" | od -abc
echo

IFS=$' \n\t'

echo
echo -n "$IFS" | od -abc
echo

exit
