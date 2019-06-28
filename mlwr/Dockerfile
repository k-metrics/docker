# *** License ****************************************************************
#   This Dockerfile is licensed under the GPL 2 or later.

# Base container（任意のrocker/*に変更可能ですがtidyverseまはたverseを推奨）
# FROM rocker/tidyverse:3.6.0
FROM kmetrics/jverse:latest

# 5)Install R packages for Machine Learning with R (alphanureric order) and others
# for Machine Learning with R
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  adabag arules C50 caret class data.table doParallel e1071 ff ffbase foreach \
  gmodels httr igraph ipred irr kernlab neuralnet psych randomForest \
  RCurl rio rjson ROCR RODBC rpart rpart.plot rvest RWeka \
  snow SnowballC tm vcd wordcloud XML xml2

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