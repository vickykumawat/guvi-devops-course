#!/bin/bash
#$Revision:001$
#$Date: $

#Variables

BASE=/home/ubuntu/cc/projects
DAYS=10
DEPTH=1
RUN=0

#Check if the directory is present or not

if [[ ! -d $BASE ]]
then
	echo "Directory does not exit:$BASE"
	exit 1
fi


# create archive folder is not present

if [[ ! -d $BASE/archive ]]
then
	mkdir $BASE/archive
	
fi



#Find the list of files largest than 20 MB

for i in `find $BASE -maxdepth $DEPTH -type f -size +20M`
do
	if [[ $RUN -eq 0  ]]
	then
	        echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive  "	
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1
	fi
done







