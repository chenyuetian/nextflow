#!/bin/bash
count=`wc $x | awk '{print $2}'`
echo $count
awk -v awkcount="$count" '{for (i = 2;i<=awkcount; i++ )print $i}' < $x | cut -c1  > hello.out
