#!/bin/bash

declare -A myarray

myarray=( [name]=paul [city]=london [age]=30)

echo "${myarray['name']}"
