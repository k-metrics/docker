#!/bin/bash
set -Ceu

# Install japanese IPA fonts
apt-get update \
 && apt-get install -y --no-install-recommends \
    fonts-ipaexfont

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

# Other Packages
install2.r --error --skipinstalled -r $CRAN \
    DiagrammeR DT forecast ggparty ggrepel GGally here learnr modeest \
    multcomp patchwork pdftools prettydoc profvis reactable rmdformats \
    skimr summarytools

# Change owner and file mode
# chown -R rstudio:rstudio /home/rstudio/.config/rstudio/rstudio-prefs.json
chown -R rstudio:rstudio /home/rstudio/.config
chmod 644 /home/rstudio/.config/rstudio/rstudio-prefs.json
chown -R rstudio:rstudio /home/rstudio/sample

# Cleanup
rm -rf /tmp/*
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/*

