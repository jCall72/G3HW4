#!/bin/bash - 
#===============================================================================
#
#          FILE: p6.sh
# 
#         USAGE: ./p6.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Bader Binsunbil (), baziz22@gmail.com
#  ORGANIZATION: 
#       CREATED: 02/12/2019 18:51
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


MONTH=$(date +"%m")
DATE=$(date +"%Y-%m-%d")
logFileLocated="$HOME/log/$MONTH/finalProject_$DATE.log"
echo >> $logFileLocated
echo "Program 6: Clean temproray files" >> $logFileLocated

echo "Woriking on cleaning files" >> $logFileLocated

rm -r temp >> $logFileLocated
rm -r tempLog >> $logFileLocated
echo "All files and temp folder have been removed" >> $logFileLocated
