#!/usr/bin/zsh
/opt/homebrew/bin/hugo
git add --all
git commit -a -m "deploy from Alfred"
git push -u origin master
echo "Site is deployed successfully"
