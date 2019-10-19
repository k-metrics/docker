FROM kmetrics/blogdown:latest

RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  tidymodels

# `tidymodels`パッケージが必要な場合は上記のコードをコメントアウトし
# 下記のコードを有効にし、ローカルでビルドしてください
# RUN install2.r --error --skipinstalled --repos https://cloud.r-project.org \
  # tidymodels 
