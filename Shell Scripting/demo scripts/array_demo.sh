#!/bin/bash

#Arrays

myArray=( 1 10.5 Raju "Hey buddy")

echo "${myArray[2]}"

echo "${myArray[3]}"

echo "All the values in my array  is ${myArray[*]}"
echo "No. of value in my array is ${#myArray[*]}"

echo "value from index 1-3 ${myArray[*]:1:3}i"

myArray+=( 5 jhon "Bye-Bye")


echo "All the values in my array  is ${myArray[*]}"
