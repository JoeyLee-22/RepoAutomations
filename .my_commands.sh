#!/bin/bash

alias bash_profile='open ~/.bash_profile'
alias commands='open ~/Documents/GitHubProjects/RepoAutomations/.my_commands.sh'
alias open_create='open ~/Documents/GitHubProjects/RepoAutomations/create.py'
alias open_delete='open ~/Documents/GitHubProjects/RepoAutomations/delete.py'

function create() {
  cd
  cd Documents/GitHubProjects
  mkdir $1
  cd
  python3 Documents/GitHubProjects/RepoAutomations/create.py $1
  cd Documents/GitHubProjects/$1
  git init
  git remote add origin https://github.com/JoeyLee-22/$1.git
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
  ask_push=false
  auto_message_bool=false
  if test -f "$1"; then
    file1="README.md"
    file2=".gitignore"
    if [[ "$1" == "$file1" ]]; then
      auto_message="update README.md"
      auto_message_bool=true
    elif [[ "$1" == "$file2" ]]; then
      auto_message="update .gitignore"
      auto_message_bool=true
    fi

    if $auto_message_bool; then
      git add $1
      while true; do
        printf "\nAuto Message: $auto_message\n"
        read -p "Auto Message? (y/n) " yn
        if [[ "$yn" == "y" ]]; then
          git commit -m "$auto_message"
          while true; do
            read -p "Push? (y/n) " yn
            if [[ "$yn" == "y" ]]; then
              git push origin master
              break
            elif [[ "$yn" == "n" ]]; then
              git reset HEAD~
              break
            fi
          done
          break
        elif [[ "$yn" == "n" ]]; then
          read -p "Enter Commit Summary: " message
          git add $1
          git commit -m "$message"
          ask_push=true
          break
        fi
      done
    else
      read -p "Enter Commit Summary: " message
      git add $1
      git commit -m "$message"
      ask_push=true
    fi
    
  elif test -d "$1"; then
    read -p "Enter Commit Summary: " message
    git add $1
    git commit -m "$message"
    ask_push=true

  elif !$ask_push; then
    echo "$1: No such file or directory"
  fi

  if $ask_push; then
    while true; do
      printf "\nYour Commit Summary: $message\n"
      read -p "Push? (y/n) " yn
      if [[ "$yn" == "y" ]]; then
        git push origin master
        break
      elif [[ "$yn" == "n" ]]; then
        git reset HEAD~
        break
      fi
    done
  fi
}