#!/bin/bash

C=$1

F=$(echo "scale=2; $C * (9/5)+32" | bc -l)

echo "$C degrees Celcius is equal to $F degrees Farenheit."

