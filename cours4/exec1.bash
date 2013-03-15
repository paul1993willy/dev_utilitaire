#!/bin/bash

IFS=:$IFS
passwd=/etc/passwd

if [ -r $passwd ]; then
	while read ligne; do
		user=($ligne)
		if [[ ${user[2]} -ge "1000" ]]; then
			echo "${user[*]}"
		fi
	done < $passwd
fi
