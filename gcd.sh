#!/bin/bash

check(){
    #自然数か判定
    if [ "expr "$1" : "^[0-9]*$"" ] && [ "$1" -ne 0 ] >&/dev/null;then
        return 0
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


check $1
check $2
gcd $1 $2
