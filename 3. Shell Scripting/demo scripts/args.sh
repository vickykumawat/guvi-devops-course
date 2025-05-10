#!/bin/bash

#to access the arguemnt


set -x
if [[ $# -eq 0 ]]
then
       echo "Please provide atleast 1 arguments"
	exit 1
fi


echo "First arguemnt is $1"

echo "Secnod argument is $2"

echo "All the argemnts are - $@"

echo "No of arguments are - $#"


#for loop to access the values from arguments

for filename in $@
do
	echo "Copying file - $filename"
done
