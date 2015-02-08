#!/usr/bin/env bash

# Setup packages
wget -q -O - https://deb.nodesource.com/setup | sudo bash -
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Accept MS Core Fonts EULA agreement
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

# Install packages
sudo apt-get update
sudo apt-get -y install xorg fluxbox default-jre firefox google-chrome-stable nodejs ttf-mscorefonts-installer

# Install Selenium standalone server
sudo npm install -g npm
sudo npm install -g selenium-standalone
sudo selenium-standalone install

# Install startup scripts
SELENIUM_ALIAS=$(cat <<EOF
alias selenium='sudo selenium-standalone start'
EOF
)
echo "${SELENIUM_ALIAS}" >> .bashrc

STARTUP_SCRIPT=$(cat <<EOF
#!/bin/sh
xterm &
EOF
)
echo "${STARTUP_SCRIPT}" > /etc/X11/Xsession.d/9999-common_start
chmod +x /etc/X11/Xsession.d/9999-common_start
