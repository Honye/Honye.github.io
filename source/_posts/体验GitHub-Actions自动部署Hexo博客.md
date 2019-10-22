---
title: 体验 GitHub Actions 自动部署 Hexo 博客
tags:
  - Hexo
  - GitHub
keywords: GitHub Actions,Hexo,GitHub
abbrlink: eaaf4b45
date: 2019-09-05 00:00:00
---

博客原先是使用 [Travis][travis] 实现自动部署的，现 GitHub 有个 [Actions][actions] 体验 CI 功能就试试。项目中还保留着 Travis 配置，只是关掉了，不能使用 Actions 的是可以使用 Travis。

> GitHub 操作可让您灵活地构建自动化的软件部署生命周期工作流程。您可以编写个别任务、调用的操作，以及结合它们创建自定义工作流程。 工作流程是您可以在仓库中创建的自定义自动化流程，用于在 GitHub 上构建、测试、封装、发行或部署任何代码项目。

GitHub Actions 目前采用 [YAML](yaml) 语法，还处于体验版，何时能正式上线就不知道了。毕竟 [GitHub Package Registry](package) 到现在还没上线呢。

## 新建 Actions

### Secrets

在 GitHub 设置生成一个 [Token][create_token]，需要有仓库的读写权限。打开项目设置，增加 **Secrets** `GH_TOKEN` 保存刚刚生成的 Token。Actions 默认有个 secret `GITHUB_TOKEN`，试了下不成功。

### Workflow

新建 Workflow 文件必须在 `.github/workflows` 目录中，采用 [YAML][yaml] 语法，名字随意，我命名为 `deploy.yml`。

```yaml
name: Hexo deployer # Actions 名字

on: # 触发条件
  push:
    branches:
      - hexo-config # 仅向 hexo-config 分支 push 时触发

jobs:
  build: # job id
    name: Build and publish # job 名，不写默认使用 job id
    runs-on: ubuntu-latest # 运行环境，可选 ubuntu-latest, ubuntu-18.04, ubuntu-16.04, windows-latest, windows-2019, windows-2016, macOS-latest, macOS-10.14

    steps:
      - uses: actions/checkout@v1

      - name: Use Node.js 10.x
        uses: actions/setup-node@v1
        with:
          node-version: 10.x

      - name: Setup hexo env
        run: |
          npm install hexo-cli -g
          npm install

      - name: Generate public files
        run: |
          hexo clean
          hexo g  

      - name: Deploy
        env:
        GH_REF: github.com/Honye/Honye.github.io.git
        GH_TOKEN: ${{ secrets.GH_TOKEN }}
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
