#!/bin/bash - 
#===============================================================================
#
#          FILE: p3.sh
# 
#         USAGE: ./p3.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Bader Binsunbil (), baziz22@gmail.com
#  ORGANIZATION: 
#       CREATED: 02/12/2019 16:00
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo >> tempLog/log
echo "Program: 3" >> tempLog/log

echo "Searching for empty email value and replace it with waldo@weber.edu" >> tempLog/log
`awk -F',' '{if($4 == ""){$4="waldo@weber.edu"}if($5 == "Female" && $6 == "Canada"){print $2", "$3", "$4} }' temp/MOCK_DATA*.csv > temp/filtered.csv` >> tempLog/log

echo "the file  has been filtered to filtered file inside test folder" >> tempLog/log

echo >> tempLog/log
exit 0
