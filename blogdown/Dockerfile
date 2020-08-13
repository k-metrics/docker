FROM kmetrics/tidymodels:latest

RUN install2.r --error --skipinstalled \
    blogdown \
 && Rscript -e "blogdown::install_hugo()" \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
