FROM kmetrics/tidymodels:latest

# RUN apt-get update \
# && apt-get install -y --no-install-recommends apt-utils ed libnlopt-dev \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/

# RUN Rscript -e "install.packages(c('rstan'))" \
#     && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN install2.r --error --skipinstalled --deps FALSE \
  rstan
#    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
