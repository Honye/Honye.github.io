---
title: Git 代码托管
tags:
  - Git
abbrlink: dd07dd9c
date: 2016-11-01 15:24:25
---

## 一、SSH配置

首先单机鼠标右键，打开`Git Bash here`，打开 Git 命令窗口，输入命令：

```bash
$ ssh-keygen -t rsa -C "your_email@youremail.com"
```

点击回车，出现如下提示：

![生成SSH](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_123.png)

<!-- more -->

这个时候我们看到询问我们保存 key 的路径，使用默认即可，直接敲回车继续，这里我已经生成过了，所以我输入了新的路径和文件名，回车后会让输入两次密码( passphrase ), 输入一个大于 4 位的密码即可。然后会看到 SSH 生成成功，如图：
![成功生成SSH](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_16.png)

这里可以看到，我们的公钥保存到了`yunfeifei_rsa.pub`文件中，大家用的是默认路径的话，就打开路径`C:\Users\Admin\.ssh`，会看到如图所示文件：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_325.png)
用文本编辑工具如记事本打开`id_rsa.pub`,复制里面的内容，先保存起来，到后面使用。
输入如下口令查看公钥：
```bash
$ cat ~/.ssh/id_rsa.pub
```
## 二、使用SSH
在上面我们使用 Git bash 生成了 SSH 的公钥和私钥，下面以 coding.net 为例介绍一下如何将公钥部署到远程 Git 仓库，打开设置中心，如图：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160809_561.png)
选择 SSH 公钥，填写公钥名称(可以随意起名字)，然后把我们刚刚从`id_rsa.pub`里面复制出来的东西粘贴到 SSH-RSA 公钥 key 这个文本框中即可。如图：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160809_107.png)
添加完成后，我们打开 Git 命令窗口测试，输入如下命令：
```bash
$ ssh -T git@coding.net
```
这个时候会提示你是否继续连接,如图：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160809_544.png)
输入 yes, 回车继续，会出现如下提示,如图:
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160810_199.png)

## Git 版本控制入门
如果你不熟悉 Git，点此查看权威 Git 书籍 [ProGit（中文版）](http://git.oschina.net/progit)，新手老鸟均适合。
[Git 官网](http://git-scm.com)
[Git 客户端下载地址](http://dl.oschina.net/search?key=git&type=soft&root=&sub=&only_title=true&p=1)
[Git 手册](http://git-scm.com/docs)
[网友整理的Git@osc教程](http://git.oschina.net/oschina/git-osc/wikis/%E5%B8%AE%E5%8A%A9#继续阅读)。
[一份很好的 Git 入门教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001373962845513aefd77a99f4145f0a2c7a7ca057e7570000)
[Git 快速入门（gif动画版）](http://git.oschina.net/wzw/git-quick-start)

## 如何在 Git 码云上上传项目
首先,注册码云账号,添加新项目,打开终端:
步骤如下:
1. cd 切换到工程目录
2. Git 全局设置
```bash
$ git config --globaluser.name "user.name"
$ git config --global user.email "user.email"
```
3. `$ git init`  初始化一个git 仓库
4. `$ touch README.md` 创建帮助文件
5. `$ git add README.md` 添加文件
6. `$ git commit -m "注释内容”`  添加注释
7. `$ git remote add origin https://git.oschina.net/username/cccc.git` 你的远程仓库地址 // 和远程仓库进行关联
8. `$ git push -u origin master` 上传仓库到码云

注意: 刷新页面后, 如果是只上传了 README 文件,需要执行如下操作:
a.  `$ git add .`  添加工程目录下所有文件 ( add 和 “.” 之间有空格)
b.  `$ git commit -m “添加注释信息"`
c.  `$ git push -u origin master` 推送要上传的文件
最后,刷新码云页面,就可以了.
```bash
$ git config user.name #查看用户名
$ git config user.email #查看邮箱地址
$ git config --global user.name "x1299906945" #修改用户名
$ git config --global user.email "hongye.jun@qq.com" #修改邮箱地址
$ mkdir Test1
$ cd Test1
$ git init
$ touch README.md
$ git commit -m "first commit"
$ git remote add origin https://git.oschina.net/x1299906945/Test1.git
$ git push -u origin master
$ ssh -T git@oschina.net
$ git push -u origin master
$ git add 使用说明.txt
$ git commit -m "简单测试"
$ git push -u origin master
```
