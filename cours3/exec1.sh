#!/bin/bash

if [[ $# != 1 ]]; then
	echo "Syntaxe d'appel : $0 <repertoire>"
fi

if [[ ! -d $1 ]]; then
	echo "Veuillez indiquer un repertoire SVP"
fi

if [[ ! -r $1 ]]; then
	echo "Veuillez indiquer un repertoire pour lequel vous avez des droits de lecture"
fi

echo -e "\n"$(ls -1 $1)"\n"

echo "$1/"$fichier

for fichier in $(ls -1 $1); do
	if [[ -f $fichier && -r $fichier ]]; then
		ligne=($(head -n 1 "$1/"$fichier | xargs -d "/" -E "\n"))
		shell=${ligne[-1]}

		if [[ ${ligne:0:2} == "#!" ]]; then
			echo "$fichier est un script utilisant le shell $shell"
		else
			echo "$fichier n'est pas un script"
		fi
	fi
done
