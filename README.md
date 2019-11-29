k-metrics docker container images
================

`rocker` based docker container images for Machine Learning with R.

　

# About this repository

本リポジトリは [データ分析勉強会](https://sites.google.com/site/kantometrics/2019)
でテキストとして利用している
[『Rによる機械学習』](https://www.shoeisha.co.jp/book/detail/9784798145112)
のサンプルコードを動かせる日本語ロケールのコンテナイメージを作成し公開しています。すべてのコンテナイメージは
[rocker](https://hub.docker.com/u/rocker) をベースとして使用しています。

なお、公開しているコンテナイメージを使用することによって生じる、いかなる直接的・間接的損害について著作者ならびに勉強会運営者はいかなる責任・サポート義務を負いません。

　

# Automated build container images

DockerHubのビルド機能で自動ビルドしているコンテナイメージは以下の通りです。なお、自動ビルドは予告なく停止する場合があります。

| image      | tag    | base image                  | descriptions                                  |
| ---------- | ------ | --------------------------- | --------------------------------------------- |
| jverse     | latest | rocker/verse:3.6.1          | Japanized base image                          |
| mlwr       | latest | jverse                      | Add R packages for Machine Learnign with R    |
| tidymodels | 3.6.1  | mlwr                        | Add tidymodels related packages               |
| blogdown   | 3.6.1  | tidymodels:3.6.1            | Add blogdown package and Hugo executable      |
| keras      | 3.6.1  | rocker/tensorflow:3.6.1     | Japanized image w/ mlwr, tidymodels, blogdown |
| keras-gpu  | 3.6.0  | rocker/tensorflow-gpu:3.6.0 | keras w/ GPU support                          |
| blogdown   | latest | tidymodels:latest           | Full installed tidymodels package w/ blogdown |

　

## Local build container images

`tidymodels`パッケージは依存関係により関連パッケージとしてインストールされる`rstan`パッケージがDockerHub環境ではビルドできないため`tidymodels`パッケージと`tidyposterior`パッケージを含むフルインストールはローカルで行っています。

| image      | tag    | base image       | descriptions                      |
| ---------- | ------ | ---------------- | --------------------------------- |
| tidymodels | latest | tidymodels:3.6.1 | Full installed tidymodels package |
| keras      | latest | keras:3.6.1      | Full installed tidymodels package |
| keras-gpu  | latest | keras-gpu:3.6.0  | Full installed tidymodels package |

　

### 【参考】 パッケージの依存関係

  - `tidymodels` imports `tidyposterior`  
  - `tidyposterior` imports `rstanarm`  
  - `rstanarm` imports `rstan`

　

# About container images

## jverse

[rocker/verse](https://hub.docker.com/r/rocker/verse) をベースに以下を追加しています。

1.  日本語ロケールの追加
2.  日本語フォント（IPA and Noto）の追加
3.  Rパッケージに必要なOSライブラリ群の追加
4.  Java環境の追加と設定

　

## mlwr

`kmetrics/jverse`をベースに
[『Rによる機械学習』](https://www.shoeisha.co.jp/book/detail/9784798145112)
のサンプルコードを動かすために必要なRパッケージをインストールしています。

　

## tidymodels

`kmetrics/mlwr`をベースに`tidymodeks`関連パッケージをインストールしています。`tidymodels`パッケージをフルインストールしたイメージが必要な場合は、ローカルビルドしている`tidymodels:latest`をご利用ください。

　

## blogdown

`kmetrics/tidymodels`をベースに`blogdown`パッケージとHugoの実行環境をインストールしています。Hugoテーマはインストールしていませんので別途`blogdown::install_theme`関数を利用してインストールしてください。なお、`C50`パッケージにプロット関連のバグがあるため暫定的にGitHubの開発版を本イメージにてインストールしています。

　

## keras/keras-gpu

ディープラーニング用にKeras/Tensorflowを利用するための [rocker/tensorflow
<i class="fa fa-external-link"></i>](https://hub.docker.com/r/rocker/tensorflow),
[rocker/tensorflow-gpu
<i class="fa fa-external-link"></i>](https://hub.docker.com/r/rocker/tensorflow-gpu)
をベースに`kmetrics/blogdown`と同じパッケージ群をインストールしています。最初に`keras::install_keras`関数を実行してKeras関連パッケージをインストールする必要があります。なお、GPU版を利用する場合には、別途、nvidiaのランタイムが必要です。

　

## ml/ml-gpu（公開予定）

ディープラーニング用にH20, gretaを追加した [rocker/ml
<i class="fa fa-external-link"></i>](https://hub.docker.com/r/rocker/ml),
[rocker/ml-gpu
<i class="fa fa-external-link"></i>](https://hub.docker.com/r/rocker/ml-gpu)
をベースに`kmetrics/blogdown`と同じパッケージ群をインストールしています。なお。GPU版を利用する場合には、別途、nvidiaのランタイムが必要です。

　

# Usage

Dockerの導入に関しては省略しますが、使い方の基本は`rocker/*`と同じで **必ずパスワードを指定** してください。

``` bash
sudo docker run -p 8787:8787 -v リンクさるローカルパス:/home/rstudio \
  -e PASSWORD=パスワード --name コンテナ名 kmetrics/イメージ名:タグ
```

| 設定項目         | 設定例        | 説明                             |
| ------------ | ---------- | ------------------------------ |
| リンクさせるローカルパス | \~/R       | 任意のローカルパス<sup>1</sup>          |
| パスワード        | password   | 任意のパスワード                       |
| コンテナ名        | tidymodels | 任意のコンテナ名称（`--name`オプションは省略可です） |
| イメージ名        | tidymodels | 実行させたいイメージ名                    |
| タグ           | 3.6.1      | 省略時は`latest`を指定したものと解釈されます     |

<sup>1</sup>
Windowsの場合`/DriveLetter/Directory/...`としてください。`DriveLetter:`というドライブ名は使えません。

　

# License

  - Dockerfiles are licensed under the GPL 2 or later.  
  - Other documents are licensed under “CC BY-NC-SA 4.0, Sampo Suzuki”
