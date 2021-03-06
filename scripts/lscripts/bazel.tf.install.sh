#!/bin/bash

##----------------------------------------------------------
### tensorflow - CPU, GPU builds
## Tested on Ubuntu 16.04 LTS, Ubuntu 18.04 LTS
##----------------------------------------------------------
#
## Dependency for building tensorflow from source
#
## Install Bazel, required for building tensorflow using sources
## https://docs.bazel.build/versions/master/install-ubuntu.html
#
##----------------------------------------------------------

echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

sudo apt-get update && sudo apt-get install bazel

# Error troubleshooting
# https://askubuntu.com/questions/769467/can-not-install-openjdk-9-jdk-because-it-tries-to-overwrite-file-aready-includ
#sudo apt-get -o Dpkg::Options::="--force-overwrite" install /var/cache/apt/archives/openjdk-9-jdk_9~b114-0ubuntu1_amd64.deb

#sudo apt-get upgrade bazel
