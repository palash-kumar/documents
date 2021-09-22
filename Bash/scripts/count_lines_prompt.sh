#!/bin/bash

echo -n "Please Enter a Filename"

read filename

nlines=$(wc -l < $filename)

echo "There are $nlines in $filename"
