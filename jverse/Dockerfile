# Base container
FROM rocker/verse:3.6.1

# Change environment to Japanese (Character and DateTime)
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN sed -i '$d' /etc/locale.gen \
  && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen ja_JP.UTF-8 \
	&& /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
RUN /bin/bash -c "source /etc/default/locale"
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Install ipaex and noto fonts
RUN apt-get update && apt-get install -y \
  fonts-ipaexfont fonts-noto-cjk

# Install OS libraries (for R packages)
#     https://demo.rstudiopm.com/client/#/
RUN apt-get update -qq && apt-get install -y \
  imagemagick libcurl4-openssl-dev libfreetype6-dev libgl1-mesa-dev \
  libglu1-mesa-dev libgmp3-dev libjpeg-dev libmagick++-dev libopenmpi2 \
  libopenmpi-dev libpng-dev libpoppler-cpp-dev libpoppler-glib-dev \
  libtcl8.6 zlib1g-dev \
  pandoc-citeproc pandoc \
  tcl8.6-dev tcl-dev tk8.6-dev tk-dev tcllib tklib \
  pdfinfo pdftotext

# Get and Setup Java for R
RUN apt-get update -qq && \
    apt-get -y --no-install-recommends install \
      cmake \
      default-jdk \
      default-jre && \
  	R CMD javareconf
