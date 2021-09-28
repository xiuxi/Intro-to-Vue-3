#!/bin/bash
for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
	git branch --track "${branch##*/}" "$branch"
	git checkout ${branch##*/}
	value=${branch##*/}
	zip -r ${value}.zip . .[^.]* -x '*.git*' -x '*.zip*' 'github_checkout_all_branches_to_zips.sh' 'github_checkout_all_branches_to_zips.txt' 'p.bat'
done
