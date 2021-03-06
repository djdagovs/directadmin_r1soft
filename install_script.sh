#!/bin/bash
# @author 		Daniel Koop <mail@danielkoop.me>
# @link 		http://danielkoop.me/portfolio-item/directadmin-r1soft-plugin/ Project page.
# @copyright 	Daniel Koop 2016
# @license 		MIT
# 
# Delete the install script
rm -rf install_script.sh

# CD to DirectAdmin
cd /usr/local/directadmin/plugins

# Download the file.
wget https://github.com/MrKoopie/directadmin_r1soft/archive/master.tar.gz -O r1soft.tar.gz

# Unzip the file
tar zxf r1soft.tar.gz
mv directadmin_r1soft-master r1soft

# Do some cleanup
rm -rf r1soft.tar.gz

# Enter the directory
cd r1soft
cp config.sample.php config.php

# Configure the serverurl
"${EDITOR:-vi}" config.php

# Set the correct permissions
chown diradmin: ../r1soft -R

echo "The plugin has been installed."