#Download Upload SSH Ruby 2+ with translate

[![Build Status](https://travis-ci.org/gilcierweb/download-upload_SSH.svg?branch=master)](https://travis-ci.org/gilcierweb/download-upload_SSH)

Link http://gilcierweb.com.br

Install Ruby
https://gorails.com/setup/ubuntu/14.04

In terminal

```shell
sudo su

sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

cd /tmp
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

rbenv install 2.2.2
rbenv global 2.2.2
ruby -v

gem install bundler

cd /download-upload_SSH

bundle install
```

Use

In terminal 

```shell
sudo su

cd /download-upload_SSH

ruby download_upload_SSH.rb
```
