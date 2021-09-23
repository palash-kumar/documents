#!/bin/bash

# Declaring an array
files=("f1.txt" "f2.txt" "f3.txt" "f4.txt")

#printing total number of elements in the array
echo "number of elements: ${#files[@]}"

# Accessing the array elements
echo ${files[3]} ${files[2]} ${files[1]} ${files[0]}
