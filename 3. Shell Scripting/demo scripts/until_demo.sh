#!/bin/bash

a=10

until [ $a -eq 1 ]
do
   echo "Value a i  $a"	
   let a--
done
