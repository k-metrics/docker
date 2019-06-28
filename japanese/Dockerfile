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

# 2)Install ipaex fonts
RUN apt-get update && apt-get install -y \
  fonts-ipaexfont fonts-noto-cjk

CMD ["/init"]