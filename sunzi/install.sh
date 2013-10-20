#!/bin/bash
set -e

source recipes/sunzi.sh
export DEBIAN_FRONTEND=noninteractive

sunzi.mute "apt-get update"
sunzi.mute "apt-get -y upgrade"

apt-get -y install git-core ntp curl
