#!/usr/bin/env bash

apt-get update > /dev/null
export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password '
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password '
apt-get install -y curl nodejs mysql-server-5.5 mysql-client-5.5 libmysqlclient-dev > /dev/null
curl -sSL https://get.rvm.io | bash -s stable --rails --quiet-curl
source /usr/local/rvm/scripts/rvm
rvm requirements
rvm install 2.2.0
rvm docs generate-ri
rvm use 2.2.0 --default
ruby -v
gem install bundler rails