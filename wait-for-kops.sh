#!/usr/bin/bash -v
#not working, still in construction ...

rm -rf kops.out
touch kops.out

while true ;
do
    kops validate cluster >> kops.out;  

    if cat kops.out | grep "error" ; then        
        echo "sleeping..."
        sleep 10;
        > kops.out;
    else
        echo continue...
        break
    fi

done 

