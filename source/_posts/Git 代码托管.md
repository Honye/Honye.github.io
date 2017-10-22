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
这个时候我们看到询问我们保存key的路径，使用默认即可，直接敲回车继续，这里我已经生成过了，所以我输入了新的路径和文件名，回车后会让输入两次密码(passphrase),输入一个大于4位的密码即可。然后会看到 SSH 生成成功，如图：
![成功生成SSH](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_16.png)

<!-- more -->

这里可以看到，我们的公钥保存到了`yunfeifei_rsa.pub`文件中，大家用的是默认路径的话，就打开路径`C:\Users\Admin\.ssh`，会看到如图所示文件：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_325.png)
用文本编辑工具如记事本打开`id_rsa.pub`,复制里面的内容，先保存起来，到后面使用。
输入如下口令查看公钥：
```bash
$ cat ~/.ssh/id_rsa.pub
```
## 二、使用SSH
在上面我们使用 Git bash 生成了 SSH 的公钥和私钥，下面以coding.net为例介绍一下如何将公钥部署到远程 Git 仓库，打开设置中心，如图：
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

### 几个常见的Git代码托管平台
说到 Git 代码托管平台，首先推荐的是 GitHub，好多好的开源项目都来自 GitHub，但是 GitHub 只能新建公开的 Git 仓库，私有仓库要收费，如果你做的是一个开源项目，可以首选 GitHub。下面推荐几个比较好的 Git 代码托管平台，这里我不做过多的说明和评价，也好让大家多看看，比较一下，找到自己的"真爱"。
1. GitHub
  关于GItHub相信大家都有耳闻，我就不详细介绍了。GitHub地址：<https://github.com/>，其首页如图：
  ![](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_916.png)
2. GitLab
  对于有些人，提到 GitHub 就会自然的想到 Gitlab, Gitlab 支持无限的公有项目和私有项目。Gitlab 地址：<https://about.gitlab.com/>，其首页截图如图：
  ![](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_277.png)
3. Bitbucket
  Bitbucket 免费支持5个开发成员的团队创建无限私有代码托管库。Bitbucket地址：<https://bitbucket.org/>，首页如图：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_866.png)
4. (推荐)开源中国代码托管
  前面说的都是国外的，下面来说几个国内的。开源中国一个账号最多可以创建1000个项目，包含公有和私有。Git @ OSC 是开源中国社区团队基于开源项目 GitLab 开发的在线代码托管平台。Git @ OSC 除了提供最基础的 git 代码托管之外，还提供代码在线查看、历史版本查看、Fork、Pull Reuqest 、打包下载任意版本、Issue、Wiki 等方便管理、开发、协作、共享的功能，具体请查看帮助。开源中国代码托管地址：<http://git.oschina.net/>，其首页如图：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_540.png)
  开源中国在几个月前又发布了团队协作开发平台，和代码托管平台一起，打造了一个十分好的团队开发平台，开源中国团队协作平台地址：<http://team.oschina.net/>，团队协作平台支持任务的创建、讨论、便签等，如图：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_985.png)
5. (推荐)Coding.net
  谈到 coding.net, 首先必须提的是速度快，功能与开源中国相似，同样一个账号最多可以创建1000个项目，也支持任务的创建等。coding.net地址：<https://coding.net/home.html>，其首页如图：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160808_51.png)
6. CSDN 代码托管
  2013年6月28日推出代码托管与社交编程平台“CODE”，CSDN CODE 系统搭建于阿里云 IaaS 平台之上，向个人开发者、IT 团队及企业提供代码托管、在线协作、社交编程、项目管理等服务。作为 CSDN 整体服务的一部分， CSDN CODE 平台使用 CSDN 通行证系统，与 CSDN 其他业务账号互通， 方便用户在各个业务间切换。CSDN 代码托管地址：<https://code.csdn.net/>，首页如图：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160809_562.png)
7. 京东代码托管平台
  作为京东电商云生态的重要一环，京东云汇中的代码托管平台2013年7月份起全面对外开放，用户只要拥有京东账号即可使用的代码托管服务。此外，为了支持国内程序员开源社区建设，目前平台对每个项目均提供免费的1G存储空间，并设置了“代码一键迁移”功能，用户可以方便的从其他GIT代码托管平台转移其项目到京东代码库。京东云汇中开放的免费代码托管平台实现了基于Git的开发任务分包管理、代码在线和离线编辑、编码助手、代码版本管理等全程的代码管理服务。京东代码托管平台地址：<https://code.jd.com/>，首页如图：
![](http://static.open-open.com/lib/uploadImg/20150108/20150108160809_941.png)
8. 淘宝代码托管平台 <http://code.taobao.org/>
  TaoCode 是为开源爱好者和广大技术人员提供交流、孵化、创新项目的平台，同时平台也遵循开源理念全面开源，欢迎更多朋友来参与平台建设，希望在我们共同的努力下能加速中国开源消费者向开源贡献者的转变。

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
