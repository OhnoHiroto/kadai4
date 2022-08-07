#!/bin/bash

check(){


    if [ $# = 0 ];then
       echo -e "Error!"
       exit 1

    elif expr "$1" : "^[a-z]*$" >&/dev/null;then
       echo -e "Error!"                                 
       exit 1
    
    elif [ "$1" -eq 0 ];then					
       echo -e "Error!"					
       exit 1

    elif  expr "$1" : "^[0-9]*$" >&/dev/null;then
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
