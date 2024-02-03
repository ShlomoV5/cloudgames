#!/bin/bash

# mydir is defined in extract the main app
homedir=$mydir
commandsFile=${homedir}/datafiles/compressionInfo
dirList=()
declare -i decompCnt=0
declare -i nocompCnt=0
declare -i dirCount=0
getFileType() {
	local filename
	filename="$1" # at this point the file's existence was already validated
	filetype=$(file -b -i "$filename" 2>/dev/null | sed 's/;.*//')
	echo $filetype

	
}
getDecompressCommand() {
	local filename
	filename="$1"
	filetype="$(getFileType $filename)"
	command="$(awk -F: -v filetype=$filetype '$1 == filetype {print $2}' $commandsFile 2>/dev/null)"
	echo "$command"
}

traverseDir() {
	local dirname
	local filelist
	dirname=$1
	dirCount=$(($dirCount + 1))
	[[ $recursive -eq 1 ]] && {
		dirList+=($(find $dirname/* $dirname/.[a-zA-Z_0-9]*  -type d 2>/dev/null))
	}
	filelist=($(find $dirname -maxdepth 1 -type f))
	for entry in "${filelist[@]}" ;do
		proccessFile "$entry"
	done
}


proccessFile() {
	local pstatus=0
	local filename=$1
	local vmesg="Warning ${filename} no action taken"
$homedir/scripts/$command
	command=$(getDecompressCommand $filename)

	[[ -z "$command" ]] && {
			   noCompCnt=$(( $noCompCnt + 1 ))
      			   echo "$filename has no corresponding command" 1>&2
	    		   vinfo $vmesg
	} || {
 		[[ "$command" =~  '/' ]] && runcommand=$command || runcommand=$homedir/scripts/$command
   		[[ ! -x $command ]] && {
     			echo "proccessFile - command $command not found" 1>&2
			noCompCnt=$(( $noCompCnt + 1 ))
    			vinfo $vmesg
   			return 12
      		}
		$runcommand $filename
		pstatus=$?
		case $pstatus in
			0) 
			   decompCnt=$(( $decompCnt + 1 ))
			   vmesg="$filename decompressed"
			;;
			*) 
			   noCompCnt=$(( $noCompCnt + 1 ))
			;;
		esac
	} 
        vinfo $vmesg
	return $pstatus
}

processDirList() {
	[[ ${#dirList[@]} -eq 0 ]] && {
		echo "No recursive directories found"
		return 0
	}
	recursive=0
	eval dirList=($(printf "%q\n" "${dirList[@]}" | sort -u))
	for dir in "${dirList[@]}" ; do
		traverseDir $dir
	done
	recursive=1
}


printTotals() {
	echo "Files decompressed: $decompCnt"
	echo "Files not proccesed: $noCompCnt"
	vinfo "Total directories traversed: $dirCount"
}
