---
title: hexo 在 coding 上部署博客
tags:
  - Hexo
  - Coding
abbrlink: b3459307
date: 2017-03-04 12:11:58
---
之前是在 GitHub 上部署的静态博客，由于 GitHub 属于国外网站，访问速度慢，听闻可以在 Coding 部署博客，故而转向 Coding。
### 1. Hexo 环境搭建
Hexo 的环境搭建我之前在 GitHub 搭建博客教程中已经说明，不在赘述。也可到 Hexo 官网查看文档。
### 2. 在 Coding 上新建项目
理论上项目名称没要求，但是在我实际操作中出现了引用资源未找到的问题。在引用路径上缺少了一个项目名。所以我的项目名和我的用户名一致，理由是如果项目名和用户名不一致，访问地址必须是 {user_name}.coding.me/{project_name}，如果项目名与用户名一致，可使用 {user_name}.coding.me 直接访问，也避免了上面说的资源引用问题，是我推荐的。
若有大神能解决资源引用问题用其他名字也是可行的。项目可私有，不影响访问。
选择项目，进入代码页面，选择 Pages 服务，部署来源后即可访问。

<!-- more -->

### 3. Hexo Push
提交和在 GitHub 大致没什么区别，只需要在 Hexo 主目录的 _config.yml 配置文件中更改下仓库地址即可。

```yaml
deploy: 
    type: git
    repository: https://git.coding.net/{user_name}/{project_name}.git
    branch: master
```
提交玩后就可以访问查看效果了