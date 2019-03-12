#! /bin/bash
set -e # stop at first failing command

cd blog
hugo -v
cd public

git init
git config user.name "r0dd8"
git config user.email "e@roddy.cool"

echo "roddy.cool" > CNAME
git add .
git commit -m "Deploy from CircleCI"

# use --quiet to avoid printing token in build logs
git push --force --quiet "https://github.com/r0dd8/coolsite.git" master:gh-pages
