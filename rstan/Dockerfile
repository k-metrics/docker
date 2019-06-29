# *** License ****************************************************************
#   This Dockerfile is licensed under the GPL 2 or later.

# Base container
FROM kmetrics/jverse:latest

# for tidymodels
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  rstan

CMD ["/init"]
