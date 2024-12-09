#!/bin/sh

git config --global include.path "$PWD"/*.gitconfig

pathadder="PATH=\$PATH:$PWD"
echo "$pathadder" >> ~/.profile && . ~/.profile #note that these lines get sourced
echo "$pathadder" >> ~/.bashrc && . ~/.bashrc
