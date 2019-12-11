FROM kmetrics/tidymodels:3.6.1

RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    blogdown \
 && Rscript -e "blogdown::install_hugo()" \
# C50 package has bugs to plot tree, so to install development version
# on GitHub fixes these bugs
 && Rscript -e "devtools::install_github('topepo/C5.0')" \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
