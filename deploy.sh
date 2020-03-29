#!/usr/local/bin/zsh

echo "1. now in hugo root"
echo "$(pwd)"
git add --all
git commit -a -m "deploy from Alfred"
git push -u origin master
echo "Site is deployed successfully"
