# *** License ****************************************************************
#   This Dockerfile is licensed under the GPL 2 or later.

# Base container
FROM rocker/tidyverse:3.6.0

# 1)Change environment to Japanese (Character and DateTime)
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN sed -i '$d' /etc/locale.gen \
  && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen ja_JP.UTF-8 \
	&& /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
RUN /bin/bash -c "source /etc/default/locale"
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# 2)Install ipaex and noto fonts
RUN apt-get update && apt-get install -y \
  fonts-ipaexfont fonts-noto-cjk

# 3)Install OS libraries (for R packages)
# パッケージが必要とするライブラリは以下で確認できます
#     https://demo.rstudiopm.com/client/#/
RUN apt-get update -qq && apt-get install -y \
  imagemagick libcurl4-openssl-dev libfreetype6-dev libgl1-mesa-dev \
  libglu1-mesa-dev libgmp3-dev libjpeg-dev libmagick++-dev libopenmpi2 \
  libopenmpi-dev libpng-dev libpoppler-cpp-dev libpoppler-glib-dev \
  libtcl8.6 zlib1g-dev \
  pandoc-citeproc pandoc
  
  # On Ubuntu 16.04 or 18.04, use PPA
  #   sudo add-apt-repository -y ppa:opencpu/poppler
  #   sudo apt-get update
  #   sudo apt-get install -y libpoppler-cpp-dev
 
# package summarytools needs tcltk's
RUN apt-get update -qq && apt-get install -y \
  tcl8.6-dev tcl-dev tk8.6-dev tk-dev tcllib tklib

# 4)Get Java and Setup for R
# rocker/ml系のコンテナイメージをベースにする場合は実行不要
RUN apt-get update -qq && \
    apt-get -y --no-install-recommends install \
      cmake \
      default-jdk \
      default-jre && \
  	R CMD javareconf

CMD ["/init"]