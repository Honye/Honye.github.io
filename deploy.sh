#!/bin/bash
set -ev
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
# GitHub Pages
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:master
# Coding Pages
git push --force --quiet "https://Honye:${CODING_TOKEN}@${CODING_REF}" master:master
