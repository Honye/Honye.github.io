---
title: 体验 GitHub Actions 自动部署 Hexo 博客
tags:
  - Hexo
  - GitHub
keywords: GitHub Actions,Hexo,GitHub
abbrlink: eaaf4b45
date: 2019-09-05 00:00:00
---

原先是使用 [Travis][travis] 实现自动化部署 Hexo 博客的，现有个 [GitHub Actions][actions] 体验 CI 功能，就试试。项目中还保留着 Travis 配置，只是在官网关掉了，不能使用 GitHub Actions 的朋友可以使用 Travis。

> GitHub Wrokflow 可让你灵活地构建自动化的软件部署生命周期工作流程。你可以编写个别任务、调用的操作，以及结合它们创建自定义 Workflow。 Wrokflow 是你可以在仓库中创建的自定义自动化流程，用于在 GitHub 上构建、测试、封装、发行或部署任何代码项目。

GitHub Actions 目前采用 [YAML](yaml) 语法，还处于体验版，何时能正式上线就不知道了。毕竟 [GitHub Package Registry](package) 到现在还没上线呢。

## 新建 Actions

### Secrets

在 GitHub 设置生成一个 [Token][create_token]，需要有仓库的读写权限。打开项目设置，增加 **Secrets** `GH_TOKEN` 保存刚刚生成的 Token。*Actions 默认有个 secret `GITHUB_TOKEN`，试了下不成功。*

### Workflow

新建 Workflow 文件必须在 `.github/workflows` 目录中，采用 [YAML][yaml] 语法，名字随意，我命名为 `deploy.yml`。

```yaml
name: Hexo deployer # Actions 名字

on: # 触发条件
  push:
    branches:
      - hexo-config # 仅向 hexo-config 分支 push 时触发，该分支存放博客源文件

jobs:
  build: # job id
    name: Build and publish # job 名，不写默认使用 job id
    runs-on: ubuntu-latest # 运行环境，可选 ubuntu-latest, ubuntu-18.04, ubuntu-16.04, windows-latest, windows-2019, windows-2016, macOS-latest, macOS-10.14

    steps:
      - uses: actions/checkout@v1 # 拉取博客最新源文件

      - name: Use Node.js 10.x # 指定 Node.js 版本
        uses: actions/setup-node@v1
        with:
          node-version: 10.x

      - name: Setup Hexo env # 初始化 Hexo 环境
        run: |
          npm install hexo-cli -g
          npm install

      - name: Generate public files # 生成博客预发布文件
        run: |
          hexo clean
          hexo g  

      - name: Deploy # 发布
        env:
        GH_REF: github.com/Honye/Honye.github.io.git # GitHub 仓库 SSH 地址
        GH_TOKEN: ${{ secrets.GH_TOKEN }} # 预先生成 GitHub Token
        run: |
          git config --global user.name "Honye"
          git config --global user.email "hongye.jun@qq.com"
          git clone https://${GH_REF} .deploy_git
          cd .deploy_git
          git checkout master
          cd ../
          mv .deploy_git/.git/ ./public/
          cd ./public/
          git add .
          git commit -m "CI built at `date +"%Y-%m-%d %H:%M:%S"`"
          git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:master
```



[travis]: https://travis-ci.org/	"Travis CI"
[actions]: https://github.com/features/actions "GitHub Actions"
[yaml]: http://www.ruanyifeng.com/blog/2016/07/yaml.html	"YAML"
[package]: https://github.com/features/package-registry "Package Registry"
[create_token]: https://github.com/settings/tokens/new "New Token"
