
.PHONY: list install serve build update pull list 

# docker not for this level of folder

list:
	        @$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

# pushes master to all remotes
# https://stackoverflow.com/questions/5785549/able-to-push-to-all-git-remotes-with-the-one-command
pushall:
	git remote | xargs -L1 -I R git push R master

pull:
	git pull origin master

update:
	bundle update

install:
	bundle install

serve:
	bundle exec jekyll serve

build:
	bundle exec jekyll build

all: build

