#!/bin/sh
#wm johnson
#encodes something into mp3 many times
#11-21-16

#if in and out not provided then exit
if [ $# -lt 2 ]
then
	echo "input error, no in/out give"
	exit 1;
fi

in=$1
out=$2
n=10

lame -S $in temp.mp3

#set n if provided
if [ $# -gt 2 ]
then
	n=$3
fi

a=0
#do the encoding 
until [ $a -eq $n ]
do
	mv temp.mp3 temp1.mp3
	lame -S -V 9 -q 9 temp1.mp3 temp.mp3
	rm temp1.mp3
	a=`expr $a + 1`	
	echo $a
done

mv temp.mp3 $out

