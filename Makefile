build:
	hugo --theme=hugo-freelancer-theme
	./deploy.sh

watch:
	hugo server --buildDrafts --watch
	open http://localhost:1313/