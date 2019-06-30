FROM rocker/verse:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    clang

# install misc
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
    rstan \
    bayesplot brms coda loo projpred rstanarm rstantools \ 
    shinystan tidybayes

# install tidymodels
RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  tidymodels tidytext

CMD ["/init"]
