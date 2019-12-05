#!/bin/bash

LSCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
source $LSCRIPTS/linuxscripts.config.sh


##----------------------------------------------------------
### vim
##----------------------------------------------------------
source $LSCRIPTS/vim.install.sh

##----------------------------------------------------------
### sublime-text editor
##----------------------------------------------------------
source $LSCRIPTS/sublimetexteditor.install.sh

##----------------------------------------------------------
### Utilities
##----------------------------------------------------------
source $LSCRIPTS/utils.install.sh

##----------------------------------------------------------
## Diff-tools
##----------------------------------------------------------
source $LSCRIPTS/diff-tools.install.sh

##----------------------------------------------------------
### Java 
##----------------------------------------------------------
source $LSCRIPTS/java.install.sh

##----------------------------------------------------------
### Pyhton 
##----------------------------------------------------------
source $LSCRIPTS/python.install.sh

##----------------------------------------------------------
### PHP 
##----------------------------------------------------------
source $LSCRIPTS/php.install.sh

##----------------------------------------------------------
### Webservers: Apache Nginx
##----------------------------------------------------------
source $LSCRIPTS/apache2.install.sh
source $LSCRIPTS/nginx.install.sh

##----------------------------------------------------------
### NodeJS 
##----------------------------------------------------------
source $LSCRIPTS/nodejs.install.sh


##----------------------------------------------------------
### Databases 
##----------------------------------------------------------
source $LSCRIPTS/redis.install.sh

##----------------------------------------------------------
## Graphics, Multimedia
##----------------------------------------------------------
##----------------------------------------------------------
### VLC
##----------------------------------------------------------
source $LSCRIPTS/vlc.install.sh

##----------------------------------------------------------
## ffmpeg
##----------------------------------------------------------
source $LSCRIPTS/ffmpeg.install.sh

##----------------------------------------------------------
### Python virtualenv virtualenvwrapper setup
##----------------------------------------------------------

source $LSCRIPTS/python.virtualenvwrapper.install.sh 3
#source $LSCRIPTS/python.virtualenvwrapper.install.sh 2

