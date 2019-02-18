

echo "This program is going to invoke all 6 previous programs and execute them at once"
sleep 1
echo "Main Program starts..."
sleep 2

function help(){
	echo Usage: -f firstYear -l lastYear -e email 
	echo Optional Usage: -u username -p password
	exit 1
}

if [[ $1 == "--help" ]]; then
	help
	exit 1
fi

#Call Program 1 "Retreiving files"
function call_1(){
	#Loop over years
	while [[ $firstYear -le $lastYear ]]; do
		bash p1.sh $firstYear
		((firstYear++))
	done
}
	
#Call Program 2 "Expanding files"
function call_2(){
	bash p2.sh
}

#Call program 3 "Filtering Data"
function call_3(){
	bash p3.sh
}

#Call Program 4 "Zipping filtered file"
function call_4(){
	bash p4.sh
}

#Call Program 5 "Secure coping file to "
function call_5(){
	bash p5.sh $username $password
}
#Call Program 6 "Cleaning all temproray files"
function call_6(){
	bash p6.sh
}

# Variables
ip="137.190.19.85"
username=${4}
#ip=`hostname -I`
DATE=$(date +"%Y-%m-%d")
MONTH=$(date +"%m")
logDirectory="$HOME/log"
logFileLocated=$logDirectory/"${MONTH}"/finalProject_$DATE.log

while getopts ":f:l:e:u:" opt
do
	case $opt in
		f)
			firstYear=$OPTARG
			;;
		l)
			lastYear=$OPTARG
			;;
		e)
			email=$OPTARG
			;;
		u)
			username=$OPTARG
			;;
		p)
			password=$OPTARG
			;;
		/?)
			help
			;;
		":")
			help
			;;
	esac
done

#Check if the user enter all requierd flags and arguments
if [[ ! $firstYear || ! lastYear || ! $email ]]; then
	help
	exit 1
fi
#Creating a temprorary tempLog folder to hold log file
if [ -d tempLog ]; then
	echo "tempLog folder existed"
else
	echo "Creating tempLog folder..."
	mkdir -p tempLog
fi

echo "Program 1"
echo "Retreiving Files"
sleep 1
call_1 $>> tempLog/log
echo ""
echo "Program 2"
echo "Expanding Files"
call_2 $>> tempLog/log
echo ""
echo "Program 3"
echo "Filtering File"
call_3 $>> tempLog/log
echo ""
echo "Program 4"
echo "Ziping File"
call_4 $>> tempLog/log
echo ""
echo "Program 5"
echo "Coping File"
call_5 $>> tempLog/log
echo ""

#Check if the last executed command is ture
echo $?

#Senging an email
echo "Sending email msg" >> tempLog/log
successMsgBody="Successfuly transfered file to FTP $ip server"
errorMsgBody="Error transfered file to FTP $ip server"
if [ $? -eq 0 ]; then
	`mail -s "Success" ${email} <<< ${successMsgBody}`
	echo ${successMsgBody} >> tempLog/log
	
else
	`mail -s "Error" ${email} <<< ${errorMsgBody}`
	echo ${errorMsgBody} >> tempLog/log
fi
echo >> tempLog/log

#Redirect all the output log file
if [[ -d $logDirectory ]]; then
	echo "log folder existed"
	sleep 1
else
	echo "Creating a log file..."
	sleep 1
	mkdir -p log
	mkdir -p log/"${MONTH}"
	echo "log folder has been created" >> tempLog/log
fi
echo >> tempLog/log

#moving log file to its target directory
echo "Moving log file to its target directory..." 
`mv tempLog/log $logDirectory/"${MONTH}"/finalProject_$DATE.log` &>> $logFileLocated

#echo >> $logFileLocated
echo "Program 6"
echo "Cleaning Temprorary Files"
call_6 >> $logFileLocated
echo ""

echo "Mission Accomplished" 

exit 0
