# Base container
FROM rocker/verse:latest

# Install japanese env and setup local
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
ENV TZ=JST

# Change locale
RUN sed -i '$d' /etc/locale.gen \
  && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen ja_JP.UTF-8 \
  && /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja" \
  && /bin/bash -c "source /etc/default/locale" \
  && ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime


COPY scripts /kmetrics_script
COPY samples /home/rstudio/sample
COPY rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json

RUN /kmetrics_script/install_jverse.sh \
  && R CMD javareconf
