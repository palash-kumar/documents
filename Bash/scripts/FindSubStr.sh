#!/bin/bash

str="Bash is Cool"
search="Cool"

expr index "$str" "$search"

expr index "$str" "ash"

expr index "$str" "123"
