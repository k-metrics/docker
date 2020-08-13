FROM kmetrics/mlwr:3.6.1

RUN install2.r --error --skipinstalled \
    broom cli crayon dials dplyr ggplot2 infer magrittr parsnip pillar \
    purrr recipes rlang rsample rstudioapi tibble tidypredict yardstick \
 && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
