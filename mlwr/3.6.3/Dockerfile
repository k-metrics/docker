FROM kmetrics/jverse:3.6.3

# Install R packages for Machine Learning with R
RUN install2.r --error --skipinstalled \
    adabag arules C50 caret class data.table doParallel e1071 ff \
    ffbase foreach gmodels httr igraph ipred irr kernlab neuralnet \
    psych randomForest RCurl rio rjson ROCR RODBC rpart rpart.plot \
    rvest RWeka snow SnowballC tm vcd wordcloud XML xml2 \
    car coefplot FNN iBreakDown kknn klaR MLmetrics olsrr ranger \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Other Packages
RUN install2.r --error --skipinstalled \
    BiocManager DiagrammeR DT forecast ggparty ggrepel GGally here learnr \
    multcomp pdftools prettydoc profvis reactable rmdformats \
    skimr summarytools \
 && Rscript -e "BiocManager::install(c('genefilter'))" \
 && install2.r --error --skipinstalled \
    modeest \
 && Rscript -e "devtools::install_github('k-metrics/ggbiplot', \
                                         build_opts = c('--no-resave-data', \
                                         '--no-manual'))" \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
