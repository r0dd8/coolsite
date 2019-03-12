#! /bin/bash
set -e # stop at first failing command

cd blog
hugo -v
cd public

git init
git config user.name "dooougs"
git config user.email "e@dou.gs"

echo "itsadougs.life" > CNAME
git add .
git commit -m "Deploy from CircleCI"

# use --quiet to avoid printing token in build logs
git push --force --quiet "https://github.com/dooougs/itsadougslife.git" master:gh-pages
