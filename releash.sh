#!/usr/bin/env sh
set -e

VERSION=`./bin/select-npm-version`

echo "release $VERSION"

npm version --no-git-tag-version $VERSION 
git add -A
git commit -m "[release] $VERSION"
git push -u origin HEAD

if [[ $VERSION =~ "beta" ]]
then
    npm publish --tag beta
else
    npm publish
fi