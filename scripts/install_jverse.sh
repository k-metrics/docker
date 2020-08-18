#!/bin/bash
set -Ceu

# Install japanese IPA fonts
apt-get update \
  && apt-get install -y --no-install-recommends fonts-ipaexfont

# Install OS libraries (for R packages)
apt-get update \
 && apt-get install -y --no-install-recommends \
    imagemagick \
    libfreetype6-dev \
    libgl1-mesa-dev libglu1-mesa-dev \
    libpoppler-cpp-dev libpoppler-glib-dev \
    libtcl8.6 \
    tcl8.6-dev tcl-dev tk8.6-dev tk-dev tcllib tklib \
    poppler-utils \
    zlib1g-dev 

# Change owner and file mode
chown rstudio:rstudio /home/rstudio/.config/rstudio/rstudio-prefs.json
chmod 644 /home/rstudio/.config/rstudio/rstudio-prefs.json

# Cleanup
rm -rf /tmp/*
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/*

