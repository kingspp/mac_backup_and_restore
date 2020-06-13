#!/bin/bash

BACKUP_DIR=''


cd ${BACKUP_DIR}

# Application list
ls -lah /Applications >> applications.txt
# Brew Packages
ls -lah /usr/local/Cellar/ >> brew.txt
# Available Commands
compgen -c >> commands.txt
# Available aliases
compgen -a >> aliases.txt
# Builtins
compgen -b >> builtins.txt
# Keywords
compgen -k >> keywords.txt
# Function
compgen -A function > functions.txt
# Conda Packages
conda list >> conda_packages.txt
# Conda Env
conda env list >> conda_env.txt
# bash_profile
cp ~/.bash_profile .
# SKHDRC
cp ~/.skhdrc .
# Yabai
cp ~/.yabairc .
# Backup Keys
cp -R ~/.ssh .
# Backup Configs
cp -R ~/.config .