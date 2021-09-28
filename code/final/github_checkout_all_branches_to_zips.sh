#!/bin/bash
for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
	git branch --track "${branch##*/}" "$branch"
	git checkout ${branch##*/}
	value=${branch##*/}
	zip -r ${value}.zip . -x '*.git*' -x '*.zip*' 'a.sh' 'a.txt'
done
