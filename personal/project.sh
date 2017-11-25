#!/bin/bash 

if [[ $1 == "" ]]; then
    echo "No project Name"
else
    export GIT_HOME='/home/git/project'
    export ORI_PATH=`pwd`
    export REP_NAME=$1
    export DIR_NAME=$REP_NAME.git

    cd $GIT_HOME
    mkdir $DIR_NAME
    cd $DIR_NAME
    git --bare init --shared
   # git  init
    #sudo chown git:www-data -R .
    sudo chmod 755 -R $REP_NAME.git
    cd $ORI_PATH

    unset GIT_HOME
    unset ORI_PATH
    unset REP_NAME
    unset DIR_NAME
fi


