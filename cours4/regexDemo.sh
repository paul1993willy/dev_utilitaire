#!/bin/bash 

tabs 5

if [[ -z ${1} ]] ; then

   echo " Oups !  votre expression régulière '_________'"
   exit

fi

clear ; cat -n capriceBlanc.txt

# on coupe au retour de ligne
# http://mindspill.net/computing/linux-notes/using-the-bash-ifs-variable-to-make-for-loops-split-with-non-whitespace-characters.html
IFS=$'\n'

declare -a fichier

# filtre des caractères accentués
fichier=($(cat capriceBlanc.txt | tr "éèêàâçÉî" "eeeaacEi"))

echo; echo
echo "=============== regex ================"
echo

for ((element=0 ; element < ${#fichier[@]} ; element+=1)) ; do \

     trouve=($(echo ${fichier[$element]} | grep -E $1))
     echo -e "    "$(($element+1))"\t"$trouve

done

echo
