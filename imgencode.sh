#!/bin/sh
#wm johnson
#edited encode.sh to do the same to image files with jpeg compression
#2-17-17

#if in and out not provided then exit
if [ $# -lt 2 ]
then
	echo "input error, no in/out give"
	exit 1;
fi

in=$1
out=$2
n=10

sips -s format jpeg $in --out temp.jpg

#set n if provided
if [ $# -gt 2 ]
then
	n=$3
fi

a=0
#do the encoding 
until [ $a -eq $n ]
do
	mv temp.jpg temp1.jpg
	sips -s format jpeg temp1.jpg --out temp.jpg
	rm temp1.jpg
	a=`expr $a + 1`	
	echo $a
done

mv temp.jpg $out

