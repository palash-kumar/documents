#!/bin/sh
x=`curl --silent  https://portal.iccbd.com/customer/login | grep "Maestro Sol" | wc -l`

if [ $x -gt 0 ]; then
	echo "Went Wrong"
fi
