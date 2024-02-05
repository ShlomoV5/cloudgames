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
vinfo() {
	[[ $verbose -eq 1 ]] && {
		message=$@
		echo $message
	}
}
