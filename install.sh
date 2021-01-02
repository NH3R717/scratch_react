#!/bin/zsh
. ~/.nvm/nvm.sh
touch .nvmrc
printf "14.15.3" > .nvmrc
nvm use
nvm current
touch readme.md
printf "# React Starter Package
## Compiled from react_install.sh" > readme.md
git init
git add -v --all
git commit -m "initial commit"
touch .gitignore
printf "/node_modules" > .gitignore
npm init -y

## add core project dependencies

# npm i --save-dev @babel/core @babel/preset-env @babel/preset-react
# npm i --save-dev webpack webpack-cli webpack-dev-server
# npm i react react-dom

## add directories & files

mkdir public
mkdir src
touch src/app.js
touch webpack.config.js

## populate files

printf "" > webpack.

## commit finished build to git repositority

git add -v --all
git commit -m "scrip build commit – basic"
#git commit -m "scrip build commit – with test/eslinting/..."