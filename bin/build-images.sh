#!/bin/bash

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

while read dir
do
	cd "$SCRIPT_HOME/../images/$dir" &&
	image_name=${PWD##*/} && # to assign to a variable
	echo "Building $image_name from $dir" &&
	docker build -t berkar/$image_name .
done <$SCRIPT_HOME/../images/build-order.txt
