FROM kmetrics/mlwr:latest

RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  broom cli crayon dials dplyr ggplot2 infer magrittr parsnip pillar \
  purrr recipes rlang rsample rstudioapi tibble tidypredict yardstick

# 依存パッケージである`rstan`パッケージがビルドでこけてインストールできません
# RUN install2.r --skipinstalled --repos https://cloud.r-project.org \
#  tidymodels 
