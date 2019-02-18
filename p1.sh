#!/bin/bash - 
#===============================================================================
#
#          FILE: hw4.sh
# 
#         USAGE: ./hw4.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Bader Binsunbil (), baziz22@gmail.com
#  ORGANIZATION: 
#       CREATED: 02/12/2019 01:04
#      REVISION:  ---
#===============================================================================

function help(){
	echo "usage argument requires 2015 or 2016"
	exit 1
}
year=${1}

if [ -z ${1} ]; then
	help "${0}"
	exit 1
fi
if [[ ${1} == "--help" ]]; then
	help "${0}"
	exit 1
fi

if [[ $year == "2015" || ${1} == "2016" ]]; then
	#Making a temproraty tempLog folder to hold log file
	if [[ -d tempLog ]]; then
		echo "tempLog folder existed while running program 1"
	else
		mkdir -p tempLog 
	fi
	echo >> tempLog/log
	echo "Program 1: ${year}" >> tempLog/log

	echo "Retrieving the file ${year}" >> tempLog/log
	wget http://icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_"${1}".tar.gz >> tempLog/log
	echo "MOCK_DATA_"${1}".tar.gz file has been retrieved succesfully" >> tempLog/log
	exit 1 >> echo
else
	help "${0}"
	exit 1
fi

exit 0
