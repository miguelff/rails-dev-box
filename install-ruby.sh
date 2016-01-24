#!/usr/bin/env bash
echo "Installing Ruby"
source /home/vagrant/.rvm/scripts/rvm
rvm use --default --install $1 >/dev/null 2>&1
