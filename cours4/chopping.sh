#!/bin/bash

declare -a chaine=monFichier.tar.gz

clear
echo

echo ${chaine}
echo


echo {chaine##*.}
echo ${chaine##*.}
echo
echo {chaine#*.}
echo ${chaine#*.}
 
echo

echo {chaine%%.*}
echo ${chaine%%.*}
echo
echo {chaine%.*}
echo ${chaine%.*}

echo

echo {chaine:0:10}
echo ${chaine:0:10}
echo
echo {chaine:11:3}
echo ${chaine:11:3}
echo
echo {chaine:15}
echo ${chaine:15}
echo
