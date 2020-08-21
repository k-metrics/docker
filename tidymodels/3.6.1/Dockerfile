FROM kmetrics/mlwr:3.6.1

RUN install2.r --error --skipinstalled \
    tidymodels \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
