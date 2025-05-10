#!/bin/bash

#Generating a random no. between 1 to 6

NO=$(( $RANDOM%6+1 ))
echo "Number is $NO"
