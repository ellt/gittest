#!/bin/sh 
#配置快捷键
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# 解决 Git 换行的问题
#1）增加 .gitattribute 文件
#在mygitrepo 下建立一个 .gitattributes 文件，在其中输入 
#    * text eol=lf 
#，详见https://help.github.com/articles/dealing-with-line-endings#platform-all
#2）通过你的客户端命令行修改换行设置，输入
#    git config --global core.autocrlf false
#    git config --global core.safecrlf true
#3）通过你的客户端命令行输入 
#    git add .gitattributes
#    git commit .gitattributes -m "commit .gitattributes"
#4）项目组统一编辑器和 IDE 的换行符，推荐 UNIX 风格的 
git config --global core.autocrlf false
git config --global core.safecrlf true
