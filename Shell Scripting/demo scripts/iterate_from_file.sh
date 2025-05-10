#!/bin/bash

FILE= "/home/ubuntu/cc/file.txt"
   
for name in $(cat $FILE)
do
	echo "Name is $name"
done
