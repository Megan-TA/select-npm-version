#! /bin/sh
set -e

VERSION=`npx select-version-cli`

git add -A
git commit -m "[build] $VERSION"
npm --no-git-tag-version version $VERSION 
# --message "[package] $VERSION"
git commit --amend -m "[release] $VERSION"
git push -u origin HEAD

if [[ $VERSION =~ "beta" ]]
then
    npm publish --tag beta
else
    npm publish
fi