#!/bin/bash

function system_setup_extended() {
  local LSCRIPTS=$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )
  source ${LSCRIPTS}/lscripts.config.sh

  ## extends pre.lite-install.sh
  source ${LSCRIPTS}/pre.install.sh

  ##----------------------------------------------------------
  ### vim
  ##----------------------------------------------------------
  source ${LSCRIPTS}/vim.install.sh

  ##----------------------------------------------------------
  ### sublime-text editor
  ##----------------------------------------------------------
  source ${LSCRIPTS}/sublimetexteditor.install.sh

  ##----------------------------------------------------------
  ### Utilities
  ##----------------------------------------------------------
  source ${LSCRIPTS}/utils.install.sh

  ##----------------------------------------------------------
  ## Diff-tools
  ##----------------------------------------------------------
  source ${LSCRIPTS}/diff-tools.install.sh

  ##----------------------------------------------------------
  ### Java 
  ##----------------------------------------------------------
  # source ${LSCRIPTS}/java.install.sh

  ##----------------------------------------------------------
  ### Pyhton 
  ##----------------------------------------------------------
  source ${LSCRIPTS}/python.install.sh
  # source ${LSCRIPTS}/python-packages.install.sh
  ##----------------------------------------------------------
  ### Python virtualenv virtualenvwrapper setup
  ##----------------------------------------------------------
  source ${LSCRIPTS}/python.virtualenvwrapper.install.sh 3
  #source ${LSCRIPTS}/python.virtualenvwrapper.install.sh 2

  ##----------------------------------------------------------
  ### PHP 
  ##----------------------------------------------------------
  # source ${LSCRIPTS}/php.install.sh

  ##----------------------------------------------------------
  ### Webservers: Apache Nginx
  ##----------------------------------------------------------
  # source ${LSCRIPTS}/apache2.install.sh
  # source ${LSCRIPTS}/nginx.install.sh

  ##----------------------------------------------------------
  ### NodeJS 
  ##----------------------------------------------------------
  # source ${LSCRIPTS}/nodejs.install.sh


  ##----------------------------------------------------------
  ### Databases 
  ##----------------------------------------------------------
  # source ${LSCRIPTS}/redis.install.sh

  ##----------------------------------------------------------
  ## Graphics, Multimedia
  ##----------------------------------------------------------
  ##----------------------------------------------------------
  ### VLC
  ##----------------------------------------------------------
  # source ${LSCRIPTS}/vlc.install.sh

  ##----------------------------------------------------------
  ## ffmpeg
  ##----------------------------------------------------------
  source ${LSCRIPTS}/ffmpeg.install.sh
}

system_setup_extended
