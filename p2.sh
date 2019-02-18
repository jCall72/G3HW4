#!/bin/bash - 
#===============================================================================
#
#          FILE: p2.sh
# 
#         USAGE: ./p2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Bader Binsunbil (), baziz22@gmail.com
#  ORGANIZATION: 
#       CREATED: 02/12/2019 01:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo >> tempLog/log
echo "Program: 2" >> tempLog/log
if [ -d temp ]; then
	echo "Folder temp exists" >> tempLog/log
else
	echo "Creating a temp folder" >> tempLog/log
	mkdir temp >> tempLog/log
	sleep 1
	echo "temp folder has been created." >> tempLog/log
fi

echo "Unpack Files" >> tempLog/log
for pkg in *.tar.gz; do
	echo working on $pkg >> tempLog/log
	sleep 1
	tar -xvzf $pkg -C $HOME/temp &>> tempLog/log;
done
echo "The two tar files untared succesfully." >> tempLog/log
exit 0

