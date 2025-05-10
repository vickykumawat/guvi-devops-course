#!/bin/bash

echo "Hey choooes and option"
echo "a = To see the current date"
echo "b = list all the files in current directory"

read choice

case $choice in
	a) date;;
	b) ls;;
	*) echo "Not a vallid input"
esac
