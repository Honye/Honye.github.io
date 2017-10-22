---
title: 利用hexo和github搭建博客（一）
tags:
  - hexo
  - github
abbrlink: 7e4c8da2
date: 2016-12-16 16:14:25
---

在搜素文章时无意间发现一篇很漂亮的博客，一看时个人博客，自己也就想创建一个属于自己的博客，初步完成后就写下此文章便于日后查询。

本文是利用hexo在GitHub上建立的静态博客。
主要有三个步骤：

>  1. 下载和安装所需软件
>  2. 搭建本地静态博客
>  3. 将本地博客同步到GitHub上
>  4. 购买设置专属域名（可选）

搭建环境
----

>  1. [node.js][1]
>  2. [git][2]
>  3. hexo

 
node.js 和 git 我就不多说了，自己在官网按着官方指示一步一步下载安装。我主要来说明下hexo的安装。
node.js 和 git 安装完成后，新建一个博客目录，在目录下使用 ``git bash here`` （可用命令行）执行
```bash
$ npm install -g hexo
```
根据网络情况下载，等待安装完成

<!-- more -->

搭建本地博客
----
cd 到本地博客路径，初始化
```bash
$ hexo init
```
安装依赖包
```bash
$ npm install
```
重启后再在博客目录下,生成必要文件和部署
```bash
$ hexo generate
$ hexo deploy
```
启动 hexo，在本地预览
```bash
$ hexo server
```
在浏览器输入 [http://localhost:4000][3] 预览。若正常显示，则本地博客初始化成功

同步到 GitHub
----
登录 [GitHub][4]，没有账号的 Sign up（注册）一个，已有账号的直接登录 Sign in（登录）
登陆后点击“+”选择“New repository”

>  - Repository name：指定格式：'GitHub用户名'.github.io
>  - Description：可选
>  - Public：必须公开

在本地博客目录下有一个``_config.yml``配置文件，使用编辑器打开，修改``Deployment``部分：
```yaml
# Deployment
## Docs: http://hexo.io/docs/deployment.html
deploy:
  type: github
  repository: https://github.com/voidking/voidking.github.io.git
  branch: master
```
**注意：冒号后面必须跟一个空格，不然会出错**
再在博客目录下执行如下命令同步到GitHub
```bash
$ hexo generate
$ hexo deploy
```
若报错 ``error deployer not found:github`` 可能是 hexo 更新问题
解决方案：将 ``github`` 改为 ``git``、将 ``https`` 改为 ``http`` 后重试

```yaml
# Deployment
## Docs: http://hexo.io/docs/deployment.html
deploy:
  type: git
  repository: http://github.com/voidking/voidking.github.io.git
  branch: master
```
若还是报错，先执行如下指令后重试
```bash
$ npm install hexo-deployer-git --save
```
在浏览器访问[https://'GitHub用户名'.github.io][5]，若正常显示，则博客已同步到GitHub

至此静态博客就初步搭建完成了！！！


  [1]: https://nodejs.org/
  [2]: https://git-scm.com/
  [3]: http://localhost:4000/
  [4]: https://github.com/
  [5]: https://chengjunx.github.io/