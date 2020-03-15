#!/bin/bash

echo "Website Scrapped at $(date)"
apt-get update
apt install wget curl git -y
curl -H "Authorization: Bearer ${{ secrets.GITHUB_TOKEN }}" https://api.github.com/repos -d '{"name":"Website","private":false}'
wget -r $URL
cd $URL
git init
git config --global user.email "altman.jiri@gmail.com"
git config --global user.name "$USER"
git add .
git commit -m "Final Update"
git push https://${{ secrets.GITHUB_TOKEN }}:x-oauth-basic@github.com/$USER/Website.git master --force
