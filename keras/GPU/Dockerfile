# Base container
FROM rocker/tensorflow-gpu:3.6.0


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

# Install R packages for Machine Learning with R
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    adabag arules C50 caret class data.table doParallel e1071 ff \
    ffbase foreach gmodels httr igraph ipred irr kernlab neuralnet \
    psych randomForest RCurl rio rjson ROCR RODBC rpart rpart.plot \
    rvest RWeka snow SnowballC tm vcd wordcloud XML xml2 \
    car coefplot FNN iBreakDown kknn klaR MLmetrics olsrr ranger \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Other Packages
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    BiocManager DiagrammeR DT ggparty ggrepel GGally learnr pdftools \
    prettydoc profvis rmdformats skimr summarytools \
 && Rscript -e "BiocManager::install(c('genefilter'))" \
 && install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    modeest \
 && Rscript -e "devtools::install_github('k-metrics/ggbiplot', \
                                         build_opts = c('--no-resave-data', \
                                         '--no-manual'))" \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# tidymodels related packages
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    broom cli crayon dials dplyr ggplot2 infer magrittr parsnip pillar \
    purrr recipes rlang rsample rstudioapi tibble tidypredict yardstick \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# blogdown and hugo executable
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    blogdown \
 && Rscript -e "blogdown::install_hugo()" \
# C50 package has bugs to plot tree, so to install development version
# on GitHub fixes these bugs
 && Rscript -e "devtools::install_github('topepo/C5.0')" \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
