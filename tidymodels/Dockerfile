FROM kmetrics/mlwr:latest

RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  broom cli crayon dials dplyr ggplot2 infer magrittr parsnip pillar \
  purrr recipes rlang rsample rstudioapi tibble tidypredict yardstick

# `tidymodels`パッケージが必要な場合は上記のコードをコメントアウトし
# 下記のコードを有効にし、ローカルでビルドしてください
# RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  # tidymodels 
