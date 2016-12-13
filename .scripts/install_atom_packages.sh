#!/bin/bash

cat $1 | \
while read CMD; do
	apm install $CMD
done
