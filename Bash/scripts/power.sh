#!/bin/bash

a=$1
b=$2

# power
result=$(($a**$b))

echo "$a^$b = $result"

# Remainder

remainder=$(($a%$b))

echo "$a%$b = $remainder"
