FROM kmetrics/tidymodels:3.6.2

RUN install2.r --error --skipinstalled \
    blogdown \
 && Rscript -e "blogdown::install_hugo()" \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
