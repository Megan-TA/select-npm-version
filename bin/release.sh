#! /bin/sh

VERSION=`npx select-version-cli`

git add -A
git commit -m "[build] $VERSION"
npm version $VERSION 
# --message "[release] $VERSION"
git commit --amend -m "[release] $VERSION"
git push

if [[ $VERSION =~ "beta" ]]
then
    npm publish --tag beta
else
    npm publish
fi