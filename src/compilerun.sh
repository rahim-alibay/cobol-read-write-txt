#!/bin/bash
clear
echo "DATE : $(date +'%m-%d-%y %T')" > cobc_myprog.log
compile_result=$(cobc -Wall -x myprog.cobol) 
CODE_RETOUR=$?
echo "$compile_result" >> cobc_myprog.log

if [ "$CODE_RETOUR" == "0" ]
then
    echo "-- Compilation OK --" && echo ""
    echo "-- Compilation OK --" >> cobc_myprog.log
    #echo "" > data-output.txt
    #rm data-output.txt && touch data-output.txt
    ./myprog
else
    echo "" && echo "-- Compilation KO --" && echo ""
    echo "-- Compilation KO --" >> cobc_myprog.log
fi
echo ""
