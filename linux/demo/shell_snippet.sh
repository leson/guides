#!/bin/bash
####################################################################
#-- 
#-- Desc    : Shell Code Snippet for demonstate the shell usage
#-- Author  : Leson (https://github.com/leson)
#-- Date    : 4 Apri 2020
#-------------------------------------------------------------------
#-- Ver.      Author          Comment
#-- -----     ------------    -------------------------------
#-- 1.0       Leson           initial create
#--
####################################################################
# set -x
set -o nounset -o errexit -o pipefail
start=$(date +"%s")
SH_NAME=$(basename $0)
CURR_PATH=$(dirname $(readlink -f ${SH_NAME}))

## Arguments Defined and setup default value
A=""
B=""

## the shell script function entry point
function main(){
    checkSyntax $@
    processArgv $@
    test
}

## Syntax Checking
function checkSyntax(){
    threshold=1
    if [[ $# -lt ${threshold} ]];then
        echo -e "==> Syntax Error: Arguments Count [$#] less than expection [${threshold}]."
        echo -e "==> Example: ${SH_NAME} key1=val1 key2=val2"
        exit 99
    fi

}

## processing arguments vector
function processArgv(){
    argc=$#
    argv=($@)
    echo -e "==> --------------------------------"
    for(( i=0;i<${argc};i=i+1 ))
    do 
        echo -e "==> ${argv[i]}"
        export ${argv[i]}
    done
    echo -e "==> Arguments Count:[${argc}];\n==> Last Argument:[${argv[${argc}-1]}]"
    echo -e "==> --------------------------------"
}

## test the logic
function test(){
    echo -e "==> current shell name:[${SH_NAME}];\n==> current shell absolutly path:[${CURR_PATH}]"
    echo -e "==> A=${A}\n==> B=${B}"
}

## function invoking.
main $@