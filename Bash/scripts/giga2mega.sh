#!/bin/bash

GIGA=$1
MEGA=$(($GIGA * 1024))
KIB=$(($MEGA * 1024))
echo "$GIGA GB = $MEGA MB = $KIB KB"
