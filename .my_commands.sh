#!/bin/bash

alias bash_profile='open ~/.bash_profile'
alias commands='open ~/Documents/GitHubProjects/RepoAutomations/.my_commands.sh'

function create() {
  cd
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
  currentdir=`pwd`
  cd
  cd Documents/GitHubProjects
  if test -d "$1"
  then
    cd
    cd Documents/GitHubProjects/$1
  else
      echo "$1: No such repository"
    cd $currentdir
  fi
}

function gp() {
  if test -f "$1"
  then
    file1="README.md"
    file2=".gitignore"
    if [[ "$1" == "$file1" ]]
    then
      git add $1
      git commit -m "update README.md"
    elif [[ "$1" == "$file2" ]]
    then
      git add $1
      git commit -m "update .gitignore"
    else
      read -p "Enter Commit Summary: " message
      git add $1
      git commit -m "$message"
    fi
    git push origin master
  else
    echo "$1: No such file or directory"
  fi
}