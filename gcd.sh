#!/bin/bash

check(){


    if [ $# = 0 ];then
       echo -e "Error!"
       exit 1

    elif expr "$1" : "^[a-z]*$" >&/dev/null;then
       echo -e "Error!"                                 
       exit 1

    elif  expr "$1" : "^[0-9]*$" >&/dev/null;then
        if [ "$1" -eq 0 ];then
            echo -e "Error!"
            exit 1
        
        else
        return 0
        fi
 
    else
        echo -e "Error!"
        exit 1
    fi
}


gcd() { 
    while [ ! 0 -eq "$2" ];
    do
    set "$1" "$2"
    set "$2" "`expr "$1" % "$2"`" 
    done
    echo "$1"
}

if [ $# -gt 2 ]; then
    echo -e "Error!"
    exit 1
fi

check $1
check $2
gcd $1 $2
