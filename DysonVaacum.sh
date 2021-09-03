#!/bin/bash


# Nom 		: dyson.sh
# Description 	: draws on a website the type of wanted documents
# Param 1 	: url
# Param 2 	: type of documents (pdf etc)
# Param 3	: number of wanted documents
# Param 4 	: destination path

clear 

if [ $# -ne 4 ]
then 
	echo "syntax error"
	echo "$0 URL type number path"
	echo "$0 http://tsoungui.fr/ebooks pdf 7 /home/yonix_nexro/ebooks_security"
fi

wget  $(lynx -dump -listonly  $1|grep -v /$ |grep "$2$"|cut -c7-|head -$3|sed s/' '/'%20'/g) -P $4 -q --show-progress

echo " "
echo "$3 .$2 files have been downloaded"
