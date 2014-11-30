#!/bin/sh

SVN_INFO_FILE='./wwwroot/.svn'

echo "########################################"

CUR_SVN_DIR="./Svndir/"$(git branch | awk '/^\*/{print $2}')".svn"

echo "CUR_SVN_DIR: $CUR_SVN_DIR"

if [ -d $CUR_SVN_DIR ];then
	echo "Already has svn instruction: ${CUR_SVN_DIR}! Something wrong!.."
	exit
fi 

mv $SVN_INFO_FILE $CUR_SVN_DIR 