#!/bin/bash

# mydir is defined in extract the main app
commandsFile=${mydir}/datafiles/compressionInfo


getFileType() {
	filename="$1" # at this point the file's existence was already validated
	filetype=$(file -b -i $filename | sed 's/;.*//')
	echo $filetype

	
}
getDecompressCommand() {
	filename="$1"
	filetype="$(getFileType $filename)"
	command="$(awk -F: -v filetype=$filetype '$1 == filetype {print $2}' $commandsFile)"
	echo "$command"
}


