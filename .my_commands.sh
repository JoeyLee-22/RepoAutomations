#!/bin/bash

alias bash_profile='open ~/.bash_profile'
alias commands='open ~/Documents/GitHubProjects/RepoAutomations/.my_commands.sh'

function create() {
  cd Documents/GitHubProjects
  mkdir $1
  cd
  python3 Documents/GitHubProjects/RepoAutomations/create.py $1
  cd Documents/GitHubProjects/$1
  git init
  git remote add origin https://github.com/JoeyLee-22/$1.git
  touch README.md
  git add .
  git commit -m "Initial commit"
  git push -u origin master
  code .
}

function delete() {
  cd
  python3 Documents/GitHubProjects/RepoAutomations/delete.py $1
  cd Documents/GitHubProjects
  rm -fr $1
}

function goto() {
  cd
  cd Documents/GitHubProjects/$1
}

function commit() {
  read -p "Enter Commit Message: " message
  git add $1
  git commit -m "$message"
  git push origin master
}