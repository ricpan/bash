#!/bin/bash
localPATH=`pwd` # path of current directory
sep='---------------'


for i in $(ls -d */); do
#echo ${i%%/};

cd ${i};
tput setaf 4; echo "Checking for changes on: " ${i}; tput sgr0;
git status;
MESSAGE=$(git status)
tput setaf 2; echo $MESSAGE; tput sgr0;

if [[ $MESSAGE == *"nothing to commit, working directory clean" ]];
        then
                tput setaf 2; echo "No changes detected: Executing: git checkout master && git pull, please wait ..."; tput sgr0;
                git checkout master;
                git pull;
                tput setaf 5; echo -e "\n DONE " ${i} "\n"; tput sgr0;
        else
                echo -e "\07\07\07\07\07";
                tput setaf 6; echo -e "\n \e[5m ########### Skiping " ${i} ". Please check your changes and commit if applicable. ########## \n"; tput sgr0;
                sleep 5s;
fi

echo $sep;
cd $OLDPWD;

done
