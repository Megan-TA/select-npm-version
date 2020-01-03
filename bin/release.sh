#! /bin/sh

VERSION=`node select-version-cli`

git add -A
git commit -m "[release] $VERSION"
npm version $VERSION 
# --message "[release] $VERSION"
git commit --amend
git push

if [[ $VERSION =~ "beta" ]]
then
    npm publish --tag beta
else
    npm publish
fi