#!/bin/bash
#
# Check current version based on active develop branch name

CURRENTVERSION=$(git tag | sort -r | tr '\n' ' ' | cut -d" " -f1)
CURRENTVERSION=${CURRENTVERSION##*v}

echo "CURRENT VERSION: ${CURRENTVERSION}"

if [ -z "$CURRENTVERSION" ]
then
	exit 1
fi

VERSIONDOC=$(cat docs/VERSION.md)

if [ "$VERSIONDOC" == "$CURRENTVERSION" ]; then
	echo "Version checked (VERSION.md file): $VERSIONDOC"
else
	echo "ERROR: Package version in VERSION.md file does not seem correct!"
	echo "Version from VERSION.md file: $VERSIONDOC"
	exit 1
fi

for doc in $(ls docs/shellunity*)
do
	docversion=$(sed -n '/Versão/p' $doc)
	docversion=$(echo ${docversion##*Versão} | cut -d"\"" -f1)
	if [ "$docversion" != "$CURRENTVERSION" ]; then
		echo "ERROR: Document version found in ${doc} does not seem correct!"
		echo "Document version: ${docversion}"
		echo "Current version: ${CURRENTVERSION}"
		exit 1
	fi
	echo "Version checked (${doc} file): $docversion"
done
