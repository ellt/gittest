#!/bin/sh

SVN_INFO_FILE='./wwwroot/.svn'

echo "########################################"

CUR_SVN_DIR="./Svndir/"$(git branch | awk '/^\*/{print $2}')".svn"

echo "CUR_SVN_DIR: $CUR_SVN_DIR"

rm $SVN_INFO_FILE -rf && cp $CUR_SVN_DIR $SVN_INFO_FILE -rf