FROM kmetrics/keras:3.6.1

# ローカルビルド専用のDockerfileです
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    tidymodels \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
