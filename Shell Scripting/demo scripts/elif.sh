#!/bin/bash

read -p "Enter your country" country

if [ $country = "India" ]
then
	echo "you are Indian"
elif [ $country = "Nepal" ]
then
	echo "You are from nepal"
else
	echo "You are from Earth"
fi
