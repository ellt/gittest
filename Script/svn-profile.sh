#!/bin/sh

SVN_INFO_FILE='./wwwroot/.svn'

echo "########################################"

CUR_SVN_DIR="./Svndir/"$(git branch | awk '/^\*/{print $2}')".svn"

echo "CUR_SVN_DIR: $CUR_SVN_DIR"
if [ -d $SVN_INFO_FILE ];then
	echo "Already has svn instruction! Something wrong!.."
	exit
fi 

if [ ! -d $CUR_SVN_DIR ];then
	echo "Can't Find svn instruction: ${CUR_SVN_DIR}! Something wrong!.."
	exit
fi 

mv $CUR_SVN_DIR $SVN_INFO_FILE 