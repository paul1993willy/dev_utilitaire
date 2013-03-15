#!/bin/bash

tabs 5

if [[ -z ${1} ]] ; then

   echo " Oups !  votre expression SED 's/__/__/g'"
   exit

fi

clear ; cat -n capriceBlanc.txt

# on coupe au retour de ligne
# http://mindspill.net/computing/linux-notes/using-the-bash-ifs-variable-to-make-for-loops-split-with-non-whitespace-characters.html
IFS=$'\n'

declare -a fichier

# filtre des caractËres accentuÈs
fichier=($(cat capriceBlanc.txt | tr "ÈËÍ‡‚Á…Ó" "eeeaacEi"))

echo; echo
echo "=============== sed ================"
echo


for ((element=0 ; element < ${#fichier[@]} ; element+=1)) ; do 

     trouve=($(echo ${fichier[$element]} | sed ${1}))
     echo -e "    "$(($element+1))"\t"$trouve

done

echo


