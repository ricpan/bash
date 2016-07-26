#!/bin/bash
echo "Choose an option: (1) => Create new branch OR (2) => Commit changes";
read option
echo $option

# Some variables, adjust to your needs
localPATH=`pwd` # path of current directory
sep='---------------'
branch_name='Branch-000/Description';
commit_msg='Branch-000: Description';

#gitstatus="On branch master nothing to commit, working directory clean";
for i in $(ls -d */); do
#echo ${i%%/};
cd ${i};
if (("$option" == 1)) ; then
	# checkout to master, reset, pull and create new branch
	git checkout master;
	git checkout . ;
	git pull;
	tput setaf 5; echo "\n DONE: Git checkout (MASTER), git checkout . and git pull  " ${i} "\n"; tput sgr0;
	echo $sep;
	git checkout -b $branch_name;
	tput setaf 5; echo "\n Status for " $branch_name  ${i} "\n"; tput sgr0;
	echo $sep;
fi

if (( "$option" == 2 )); then
	git add . ;
	git commit -m "$commit_msg";
	tput setaf 5; echo "\n Done commit for -  " ${i} "\n"; tput sgr0;i
fi

cd $OLDPWD;
done
