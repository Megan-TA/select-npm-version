#! /bin/sh
set -e

VERSION=`npx select-npm-version`

# git add -A
# git commit -m "[build] $VERSION"
# npm version --no-git-tag-version $VERSION 
git add -A
# --message "[package] $VERSION"
git commit -m "[release] $VERSION"
git push -u origin HEAD

if [[ $VERSION =~ "beta" ]]
then
    npm publish --tag beta
else
    npm publish
fi