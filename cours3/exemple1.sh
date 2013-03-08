#!/bin/bash

for file in $1
do
	if [ -f $file ]; then echo "$file est un fichier ordinaire";fi
	if [ -d $file ] ;then echo "$file est un répertoire";fi
   	if [ -p $file ]; then echo "$file est un tube nommé";fi
   	if [ -L $file ]; then echo "$file est un lien symbolique";fi
done
exit 0
