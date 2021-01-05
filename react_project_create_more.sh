#!/bin/zsh
# . ~/.nvm/nvm.sh
# touch .nvmrc
# printf "14.15.3" > .nvmrc
# nvm use
# nvm current
cd ~/Desktop
mkdir fresh_react_project && cd "$_"
printf "# React Starter Package
## Compiled from react_install.sh
### Rated – GR (Golden Retriever) and Up" > readme.md
git init
git add --all
git commit -m "initial commit"
npm init -y
printf "/node_modules" > .gitignore

# #! development dependencies (necessary)
# npm i @babel/core @babel/preset-env @babel/preset-react --save-dev
# npm i webpack webpack-cli webpack-dev-server -D

##! development dependencies options
# npm install sass-loader node-sass --save-dev
# npm i css-loader style-loader --save-dev

##! deployed dependencies (necessary)
# npm i react
# npm install react react-dom

##! deployed dependencies (options)
# npm i ""

#! keeping is succint __________________________________________________
#! birds

## update package.json file (w/gnu sed not freebds [macOS] sed)
gsed -i '/"scripts": {/a \
    "start": "webpack --mode=development", \
    "build": "webpack --mode=production",' package.json

#! add – directories & files
mkdir public
mkdir src
mkdir src/styles

#? alternate
# touch webpack.config.js
#?
#! add – webpack.config.js
echo "// import
const path = require('path');

module.exports = {
  entry: './src/app.js',
  output: {
    path: path.join(__dirname, 'public'),
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
      // Rules to load scss
      {
      // Some change here
        test: /\.scss$/,
        use: ['style-loader', 'css-loader', 'sass-loader']
      }
    ]
  },
  devtool: 'cheap-module-eval-source-map',
  devServer: {
    contentBase: path.join(__dirname, 'public')
  }
};" > webpack.config.js
#!

#! add – .babelrc

printf "{
  \"presets\": [\"@babel/preset-env\", \"@babel/preset-react\"]
}" .babelrc

#! add – app.js
printf "import React from 'react';
import ReactDOM from 'react-dom';
import './styles/styles.css';

const template = <p>core react project from shell (zsh) script</p>;

ReactDOM.render(template, document.getElementById('poodle_fur'));" > src/app.js
#!

#! add – index.html
printf "  <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>React App</title>
      </head>

      <body>
        <div id="poodle_fur"></div>

        <script src="./bundle.js"></script>
      </body>
    </html>" > public/index.html

#! add – styles.scss

# printf "\$brand-color: blue;

# * {
#   color: \$brand-color;
# }
# " > src/styles.scss
#!

#? alternate
# touch src/styles.css
#?
#! add – styles.css
printf "color: gold" > src/styles.css
#!

## commit finished build bsic to git repositority
#
git add -v --all
git commit -m "scrip build commit – basic"

## select added features
#
#git commit -m "scrip build commit – with test/eslinting/..."

## build and run locally
npm run dev-server