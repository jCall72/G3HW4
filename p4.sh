#!/bin/bash - 
#===============================================================================
#
#          FILE: p4.sh
# 
#         USAGE: ./p4.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Bader Binsunbil (), baziz22@gmail.com
#  ORGANIZATION: 
#       CREATED: 02/12/2019 17:25
#      REVISION:  ---
#===============================================================================

set -o nounset # Treat unset variables as an error

echo >> tempLog/log
echo "Program: 4" >> tempLog/log

file=$HOME/temp/filtered.csv
DATE=$(date +"%Y_%m_%d_%H:%M")

echo "Zipping the file to ${PWD}" >> tempLog/log

`zip Group3_DATA_FILTER_${DATE}.zip ${file}` &>> tempLog/log

echo "filtered.csv file has been zipped succesfully to a new file located in $HOME." >> tempLog/log
echo >> tempLog/log
exit 0
