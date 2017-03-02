#!/bin/bash

file=$1
oldname=$2
newname=$3

if [ ! $# == 3 ]; then
 	echo "Usage is: rename_UID.sh <file> <old UID> <new UID>"
	exit
fi

echo "Input file is: ${file}"

echo "UID will be renamed from ${oldname} to ${newname}"


####
# Start renaming
# Need to change character encoding to UTF-8 from UTF16LE
tname=$$
#iconv -f UTF-16LE -t UTF-8 ${file} > ${tname}.txt

#Find/replace the oldname with newname via sed
	#Set up new file name
	newfile=`echo ${file} | sed "s/${oldname}/${newname}/"`
sed "s/${oldname}/${newname}/" ${tname}.txt > ${newfile}.utf8
# Change character encoding back to UTF-16LE

#iconv -f UTF-8 -t UTF-16LE ${newfile}.utf8 > ${newfile}
echo "Output file is named: ${newfile}"

#Clean up
rm ${tname}.txt ${newfile}.utf8
