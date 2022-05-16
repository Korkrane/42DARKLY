#!/bin/bash
links=`curl -L 192.168.56.101/.hidden 2>/dev/null | cut -d '>' -f2 | cut -d '/' -f1 | tail -n +5 | head -n +26`

for i in $(echo $links | tr " " "\n")
do
    curl -L 192.168.56.101/.hidden/$i/README >> log;
	test=`curl -L 192.168.56.101/.hidden/$i/ | cut -d '>' -f2 | cut -d '/' -f1 | tail -n +5 | head -n +26`
    for j in $(echo $test | tr " " "\n")
    do
	    curl -L 192.168.56.101/.hidden/$i/$j/README >> log;
        testk=`curl -L 192.168.56.101/.hidden/$i/$j | cut -d '>' -f2 | cut -d '/' -f1 | tail -n +5 | head -n +26`
        for k in $(echo $testk | tr " " "\n")
        do
         curl -L 192.168.56.101/.hidden/$i/$j/$k/README >> log;
        done;
    done;
done;