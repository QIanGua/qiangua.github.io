.PHONEY: deploy
deploy:
	@echo "🎁 Preparing commit"
	hugo
	git add .
	git commit -a -m "$m"
	# git push -u origin master
	# @echo "🚀 Site is deployed!"