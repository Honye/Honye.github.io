---
title: Hexo 在 GitHub 和 Coding 同时发布
tags:
  - Hexo
  - GitHub
  - Coding
abbrlink: d973cb7c
date: 2017-03-04 13:08:58
---

### 多平台发布

在 GitHub 和 Coding 上都有博客，分开一一发布比较麻烦，其实 Hexo 是支持在多个平台发布的。
修改 Hexo 主目录下的 _config.yml 配置文件即可

```yaml
deploy:
  - type: git
    repository: https://github.com/Hongye567/Hongye567.github.io.git
    branch: master
  - type: git
    repository: https://git.coding.net/Honye/Honye.git
    branch: master
```

<!-- more -->

### 免输入密码

Hexo 每次提交时都要求输入用户名和密码，尤其在多平台发布时需要多次输入用户名和密码很是麻烦。
要求输入密码的原因是我们的仓库地址用的是 HTTPS 不是 SSH。

**1. 首先生成 SSH 密钥**

```shell
$ git config --global user.name "yourname"  // 配置 git 用户名
$ git config --global user.email "youremail@email.com"  // 配置 git 邮箱
$ cd ~/.ssh  // 查看是否已有.ssh文件夹，若有可备份删除
$ ssh-keygen -t rsa -C "youremail@email.com"  // 生成 SSH 密钥
```

生成密钥时会提示选择密钥保存路径，直接回车默认路径即可。
会提示输入密码和确认密码，直接回车代表不设置密码。

**2. 部署公钥**
在 GitHub 和 Coding 在部署公钥操作基本一样，我不一一赘述，仅以 GitHub 为例。
打开 GitHub 项目，选择上方菜单 Settings，接着选择左侧菜单 Deploy keys，接着 Add deploy key，打开前面密钥所在文件夹，将 id_rsa.pub 文件中的内容粘贴在 GitHub 即可。

**3. Hexo 提交**
修改 Hexo 主目录下 _config.yml 配置文件中的参数

```yaml
deploy:
  - type: git
    repository: git@github.com:Hongye567/Hongye567.github.io.git
    branch: master
  - type: git
    repository: git@git.coding.net:Honye/Honye.git
    branch: master
```

现在提交就可以不用输入密码了。提交的时候可能会报 authenticity 可靠性问题，直接输入 yes 忽略即可。