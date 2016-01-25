#!/usr/bin/env bash
echo "Installing Ruby"
source /home/vagrant/.rvm/scripts/rvm
rvm use install $1 >/dev/null 2>&1
rvm use $1 --default >/dev/null 2>&1
