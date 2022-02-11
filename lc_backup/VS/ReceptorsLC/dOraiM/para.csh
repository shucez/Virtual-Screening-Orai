#!/bin/csh

foreach f (`find . -name "*$1*" -print`)
	echo $f
	cat $f
end
