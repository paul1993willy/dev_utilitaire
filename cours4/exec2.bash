#!/bin/bash

echo "Entrez une adresse MAC"
read mac

if [[ $mac =~ ^((([0-9]|[a-f]){2}:){5}([0-9]|[a-f])) ]]; then
	echo "C'est une adresse MAC"
else
	echo "Ce n'est pas une adresse MAC"
fi
