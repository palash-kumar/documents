#!/bin/bash

num=(1 2 3 4 5)

echo ${num[*]}

# Deleting an element from specific index
unset num[2]

echo ${num[*]}

# Deleting the whole array
unset num

echo ${num[*]}
