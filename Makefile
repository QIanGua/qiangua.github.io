.PHONEY: deploy
deploy:
	@echo "🎁 Preparing commit"
	/usr/local/bin/hugo
	git add .
	git commit -a -m "$m"
	git push -u origin master
	@echo "🚀 Site is deployed!"


alfred:
	@echo "🎁 Preparing commit"
	/usr/local/bin/hugo
	git add .
	git commit -a -m "deploy with Alfred"
	git push -u origin master
	@echo "🚀 Site is deployed!"
