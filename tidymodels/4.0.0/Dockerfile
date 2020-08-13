FROM kmetrics/mlwr:4.0.0

RUN install2.r --error --skipinstalled \
    tidymodels \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
