# Repository Automations
Python and shell program to automate creating and deleting repositories(repos) and adding, committing, and pushing changes

- - -

# How To Use
You will need to add your own paths to the .my_commands.sh file

create -- makes new repo and adds a readme file

delete -- deletes given repo from github and from local files

goto -- goes to a given repo to be able to use commit command

gp -- adds then commits local changes and asks for a summary (summary is automatically 'update README.md' if given file is README.md) then pushes it to master for a given file

For all commands, you need to give a repo or file name after the command

Ex: `create test` or `commit test.py`