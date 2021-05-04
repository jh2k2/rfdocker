#!/bin/bash
apt -y update

apt -y install wget unzip

chromeUrl=https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_linux64.zip

wget $chromeUrl -O /tmp/chromedriver.zip
unzip /tmp/chromedriver.zip -d /tmp
cp /tmp/chromedriver /usr/local/bin/

wget https://github.com/mozilla/geckodriver/releases/download/v0.29.0/geckodriver-v0.29.0-linux64.tar.gz -O /tmp/geckodriver.tar.gz
tar xvf /tmp/geckodriver.tar.gz -C /usr/local/bin
