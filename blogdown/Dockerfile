FROM kmetrics/tidymodels:latest

RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    blogdown C50 \
 && Rscript -e "blogdown::install_hugo()" \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
