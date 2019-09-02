FROM kmetrics/tidymodels:latest

RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  blogdown

RUN Rscript -e "blogdown::install_hugo()"
