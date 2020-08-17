#!/bin/bash
set -e

install2.r --error --skipinstalled -r $CRAN \
    tidymodels

# Cleanup
cd /
rm -rf /tmp/*
apt-get autoremove -y
apt-get clean -y
rm -rf /tmp/downloaded_packages
rm -rf /var/lib/apt/lists/*

