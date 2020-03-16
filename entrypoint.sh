#!/bin/bash

echo "Website Scrapped at $(date)"
apt-get update
apt install wget curl git -y
curl -H "Authorization: Bearer ${{ github.token }}" https://api.github.com/repos -d '{"name":"Website-JuryA-Keybase","private":false}'
wget -r $URL
cd $URL
git init
git config --global user.email "altman.jiri@gmail.com"
git config --global user.name "$USER"
git add .
git commit -m "Final Update"
git push https://${{ github.token }}:x-oauth-basic@github.com/$USER/Website-JuryA-Keybase.git master --force
