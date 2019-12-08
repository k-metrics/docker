FROM jupyter/datascience-notebook:latest

USER root

RUN apt-get update \
 && apt-get install -y language-pack-ja-base language-pack-ja \
 && apt-get install -y fonts-ipaexfont \
 && apt-get clean && rm -rf /var/lib/apt/lists/* \
 && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8

# RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen \
#  && locale-gen
