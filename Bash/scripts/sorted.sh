#!/bin/bash
num=(1 2 3 5 4)
echo "Before sorting array num: "
echo ${num[@]}

num+=(${num[3]})
unset num[3]

echo "After sorting array num: "
echo ${num[@]}
