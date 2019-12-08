# Base container
FROM rocker/verse:3.6.1

# Install japanese env and fonts, and setup local
RUN apt-get update \
 && apt-get install -y task-japanese locales-all \
 && apt-get install -y fonts-ipaexfont fonts-noto-cjk \
 && apt-get clean && rm -rf /var/lib/apt/lists/* \
 && /bin/bash -c "source /etc/default/locale" \
 && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8

# Install OS libraries (for R packages)
#     https://demo.rstudiopm.com/client/#/
RUN apt-get update -qq \
 && apt-get install -y \
    imagemagick libcurl4-openssl-dev libfreetype6-dev libgl1-mesa-dev \
    libglu1-mesa-dev libgmp3-dev libjpeg-dev libmagick++-dev libopenmpi2 \
    libopenmpi-dev libpng-dev libpoppler-cpp-dev libpoppler-glib-dev \
    libtcl8.6 zlib1g-dev \
    pandoc-citeproc pandoc \
    tcl8.6-dev tcl-dev tk8.6-dev tk-dev tcllib tklib \
    poppler-utils \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Get and Setup Java for R
RUN apt-get update -qq \
 && apt-get -y --no-install-recommends install \
      cmake \
      default-jdk \
      default-jre \
 && apt-get clean && rm -rf /var/lib/apt/lists/* \
 &&	R CMD javareconf
