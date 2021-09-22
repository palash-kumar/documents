#!/bin/bash

n1=$(wc -l < $1)
n2=$(wc -l < $2)
n3=$(wc -l < $3)

echo "There are $n1 in $1"
echo "There are $n2 in $2"
echo "There are $n3 in $3"
