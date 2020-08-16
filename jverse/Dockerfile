# Base container
FROM rocker/verse:latest

# Install japanese env and setup local
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
ENV TZ=JST
RUN sed -i '$d' /etc/locale.gen \
  && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen ja_JP.UTF-8 \
  && /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja" \
  && /bin/bash -c "source /etc/default/locale" \
  && ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Install japanese fonts
RUN apt-get update -qq \
  && apt-get install -y fonts-ipaexfont \

# Install OS libraries (for R packages)
RUN apt-get update -qq \
 && apt-get install -y \
    imagemagick libmagick++-dev libjpeg-dev libpng-dev \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libgmp3-dev \
    libopenmpi-dev \
    libpoppler-cpp-dev libpoppler-glib-dev \
    libtcl8.6 \
    zlib1g-dev \
    pandoc-citeproc pandoc \
    tcl8.6-dev tcl-dev tk8.6-dev tk-dev tcllib tklib \
    poppler-utils \
  && apt-get remove -y systemd \
  && apt-get -y autoremove \
  && apt-get -y clean

# Java installed in rocker/verse
# RUN apt-get update -qq \
# && apt-get -y --no-install-recommends install \
#      cmake \
#      default-jdk \
#      default-jre \
# && apt-get clean && rm -rf /var/lib/apt/lists/* \

Rscript -e "blogdown::install_hugo()" \
R CMD javareconf
