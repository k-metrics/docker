FROM kmetrics/tidymodels:3.6.1

# ローカルビルド専用のDockerfileです
RUN install2.r --error --skipinstalled \
    tidymodels \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
