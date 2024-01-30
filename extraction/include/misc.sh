#!/bin/bash

myname=$(basename $0)
mydir=$(cd $(dirname $0);pwd)

commandsFile=${mydir}/compressionInfo

ErrorExit() {
	message="$1"
	exitcode=${2-1}
	[[  "$exitcode" -eq "$exitcode" ]] 2>/dev/null  || {
		echo "${myname}: function  ErrorExit bad exit code passed ($exitcode) defaulting to 1" 1>&2
		exitcode=1
	}
	echo "${myname}: ${message}" 1>&2
	exit  "$exitcode"
	
}
show_help() {
	echo  "Syntax: ${myname} [-h] [-v] [-r] file [file ...]" 1>&2
	echo " -v - verbose echo each file decompressed and warn for each file that was not decompressed" 1>&2
	echo " -r - recursive - will traverse contents of folders recursively, performing unpack on each" 1>&2
	echo " -h - help will print this message"
}

