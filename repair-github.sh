#!/bin/bash

pushd public
git pull
if [[ $? -ne 0 ]]; then
	echo "Git workspace is not clean checkin all changes before running this
fi
git status
if [[ $? -ne 0 ]]; then
	echo "Git workspace is not clean checkin all changes before running this
fi

git push origin :master
git push -u origin master
popd

echo "Under GitHub Pages select the master branch as the soruce and click save"
echo "Opening https://github.com/lesliecarrier/lesliecarrier/settings"
open https://github.com/lesliecarrier/lesliecarrier/settings
