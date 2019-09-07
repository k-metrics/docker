FROM rocker/verse:3.6.1

RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils ed libnlopt-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/

RUN Rscript -e "install.packages(c('rstan'))" \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# RUN install2.r --error --skipinstalled \
#    rstan \
#    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
