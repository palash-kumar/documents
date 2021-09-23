#!/bin/bash

distros=("Ubuntu" "Red Hat" "Fedora")

echo ${distros[*]}

# Adding new element to the existing array
distros+=("Kali")

echo ${distros[*]}
