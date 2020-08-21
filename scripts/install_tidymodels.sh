#!/bin/bash
set -Ceu

install2.r --error --skipinstalled -r $CRAN \
    tidymodels

# Cleanup
rm -rf /tmp/*
apt-get autoremove -y
apt-get clean -y
rm -rf /tmp/downloaded_packages
rm -rf /var/lib/apt/lists/*

