# *** Disclaimer **************************************************************
#   本ファイルは`tokyor/rstudio`(https://hub.docker.com/r/tokyor/rstudio/)の
#   Dockerfileをベースに日本語環境で『Rによる機械学習』のサンプルコードを
#   動かせるコンテナイメージ（debian based）をビルドするためのDockerfileです。
#   本ファイルを使用することによって生じる、いかなる直接的・間接的損害に
#   ついて著作者ならびに本勉強会運営者はいかなる責任・サポート義務は負い
#   ません。
# 
#  *** About this file *******************************************************
#   `rocker/tydiverse`(https://hub.docker.com/u/rocker)のコンテナイメージを
#   ベースに以下を追加してあります。なお、環境にもよりますがビルドに一時間
#   以上かかる場合があります。
# 
#     1. 日本語ロケールの追加設定
#     2. 日本語フォント（IPA Fonts）の追加
#     3. Rパッケージをインストールするために必要なOSライブラリの追加
#     4. JDKのインストールと設定
#     5. 『Rによる機械学習』のサンプルファイルで使用してるRパッケージを追加
#         その他、あると便利なパッケージを追加
# 
# *** Usage example **********************************************************
#    $ sudo docker build -f Dockerfile -t kmetrics/mlwr .
# 
#   ビルドするコンテナイメージ名はベースとした"rocker/*"と同様に名付けると
#   分かりやすくなりますがDocker Hubに同名のアカウントがあると問題になる？

# *** ATTENTION **************************************************************
# --deps "TRUE"を指定すると依存パッケージである`Rmpi`をインストールする際に
# エラーになるためここでは指定していません。
# `Rmpi`は以下のようなエラーになるのでパスを設定すれば回避できるかも…
#   --------------------------------------------------------------------------
#   The value of the MCA parameter "plm_rsh_agent" was set to a path
#   that could not be found:
#
#     plm_rsh_agent: ssh : rsh
#
#   Please either unset the parameter, or check that the path is correct
#   --------------------------------------------------------------------------
#   It looks like orte_init failed for some reason; your parallel process is
#   likely to abort.  There are many reasons that a parallel process can
#   fail during orte_init; some of which are due to configuration or
#   environment problems.  This failure appears to be an internal failure;
#   here's some additional information (which may only be relevant to an
#   Open MPI developer):
# 
# *** ATTENTION for Windows User *********************************************
# 仮想環境（Hyper-V）には4GB超のメモリを割り当てないとパッケージをコンパイル
# する際にメモリ不足となりコンテナイメージが作成できません。
# 
# *** License ****************************************************************
#   This Dockerfile is licensed under the GPL 2 or later.


# Base container（任意のrocker/*に変更可能ですがtidyverseまはたverseを推奨）
FROM rocker/tidyverse:latest

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
  fonts-ipaexfont 
#  fonts-noto-cjk

# 3)Install OS libraries (for R packages)
# パッケージが必要とするライブラリは以下で確認できます
#     https://demo.rstudiopm.com/client/#/
RUN apt-get update -qq && apt-get install -y \
  imagemagick libcurl4-openssl-dev libfreetype6-dev libgl1-mesa-dev \
  libglu1-mesa-dev libjpeg-dev libmagick++-dev libopenmpi2 \
  libopenmpi-dev libpng-dev libpoppler-cpp-dev libpoppler-glib-dev \
  libtcl8.6 zlib1g-dev
  
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

# 5)Install R packages for Machine Learning with R (alphanureric order) and others
# for Machine Learning with R
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  adabag arules C50 caret class data.table doParallel e1071 ff ffbase foreach \
  gmodels httr igraph ipred irr kernlab neuralnet psych randomForest \
  RCurl rio rjson ROCR RODBC rpart rpart.plot rvest RWeka \
  snow SnowballC tm vcd wordcloud XML xml2

# for tidymodels
# RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
#   tidymodels tidytext

# for model and infer process
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  FNN iBreakDown kknn klaR ranger

# Other Packages
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  BiocManager DT ggrepel GGally profvis rmdformats skimr summarytools

# If you need `modeest` package, then commented out following lines
RUN Rscript -e "BiocManager::install(c('genefilter'))" \
  && install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    modeest

CMD ["/init"]