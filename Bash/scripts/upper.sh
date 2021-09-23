#!/bin/bash

echo "converted contents in upper case"

tr '[:lower:]' '[:upper:]' < $1
