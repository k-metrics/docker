FROM kmetrics/mlwr:latest

RUN install2.r --error --skipinstalled \
    tidymodels \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
