#!/bin/bash - 
#===============================================================================
#
#          FILE: p5.sh
# 
#         USAGE: ./p5.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Bader Binsunbil (), baziz22@gmail.com
#  ORGANIZATION: 
#       CREATED: 02/12/2019 18:12
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

echo >> tempLog/log

function help(){
	echo "Usage: two parameter"
	echo "syntax: filename.sh username password"
	exit 1
}
if [ -z ${1} ]; then
	help "${0}"
	exit 1
fi
server="icarus.cs.weber.edu"
username="${1}"
password="${2}"
filteredFile="$HOME/*_DATA_FILTER_*.zip"
#distination="home/"${1}"/ftp/files"
distination="home/"${1}""

`scp $filteredFile $username@$server:/home/$username` &>> tempLog/log

echo file has been transfered succesfully to icarus server>> tempLog/log

echo >> tempLog/log
exit 0
