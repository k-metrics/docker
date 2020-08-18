#!/bin/bash
set -Ceu

# Install Machine Learning with R related packages
install2.r --error --skipinstalled -r $CRAN \
    adabag arules C50 caret class data.table doParallel e1071 ff \
    ffbase foreach gmodels httr igraph ipred irr kernlab neuralnet \
    psych randomForest RCurl rio rjson ROCR RODBC rpart rpart.plot \
    rvest RWeka snow SnowballC tm vcd wordcloud XML xml2 \
    car coefplot FNN iBreakDown kknn klaR MLmetrics olsrr ranger

# Other Packages
install2.r --error --skipinstalled -r $CRAN \
    DiagrammeR DT ggparty ggrepel GGally here learnr multcomp \
    pdftools prettydoc profvis rmdformats skimr summarytools modeest

# Rscript -e "BiocManager::install(c('genefilter'))"
# install2.r --error --skipinstalled -r $CRAN \
#     modeest

# GitHub package
Rscript -e "devtools::install_github('k-metrics/ggbiplot', \
                                     build_opts = c('--no-resave-data', \
                                     '--no-manual'))"

# Cleanup
rm -rf /tmp/*
apt-get autoremove -y
apt-get clean -y
rm -rf /tmp/downloaded_packages
rm -rf /var/lib/apt/lists/*

