#!/bin/bash


# Nom 		: dyson.sh
# Description 	: Aspire sur un site donné un type de documents donné
# Param 1 	: url du site de type index of
# Param 2 	: extention des documents a telecharger
# Param 3	: nombre de documentsa  telecharger
# Param 4 	:repertoire de destination

clear 

if [ $# -ne 4 ]
then 
	echo "erreur de syntaxe"
	echo "$0 URL xextension nbfic destination"
	echo "$0 http://tsoungui.fr/ebooks pdf 7 /home/davy/ebooks_security"
fi

wget  $(lynx -dump -listonly  $1|grep -v /$ |grep "$2$"|cut -c7-|head -$3|sed s/' '/'%20'/g) -P $4 -q --show-progress

echo " "
echo "$3 fichiers au format .$2 ont été téléchargés"
