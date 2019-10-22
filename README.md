k-metrics docker container images
================

`rocker/verse` based docker container images for Machine Learning with
R.

　

## About this repository

本リポジトリは[rocker/verse](https://hub.docker.com/r/rocker/verse)をベースに日本語環境で[データ分析勉強会](https://sites.google.com/site/kantometrics/2019)におけるテキストである[『Rによる機械学習』](https://www.shoeisha.co.jp/book/detail/9784798145112)のサンプルコードが動かせるコンテナイメージを作成し公開しています。  
　  
なお、公開しているコンテナイメージを使用することによって生じる、いかなる直接的・間接的損害について著作者ならびに勉強会運営者はいかなる責任・サポート義務を負いません。

　

## Container images

公開しているコンテナイメージは以下の通りです。

| image           | base image         | descriptions                               | build     |
| --------------- | ------------------ | ------------------------------------------ | --------- |
| jverse          | rocker/verse:3.6.1 | Japanized base image                       | automated |
| mlwr            | jverse             | Add R packages for Machine Learnign with R | automated |
| tidymodels      | mlwr               | Add tidymodels related packages            | automated |
| blogdown        | tidymodels         | Add blogdown package and Hugo executable   | automated |
| tidymodels:full | blogdown           | Add tidymodels and tidyposterior package   | manual    |

　

### jverse

[rocker/verse](https://hub.docker.com/r/rocker/verse)をベースに以下をインストールしています。

1.  日本語ロケールの追加
2.  日本語フォント（IPA and
Noto）の追加
3.  Rパッケージに必要なOSライブラリ群の追加
4.  Java環境の追加と設定

　

### mlwr

`jverse`をベースに[『Rによる機械学習』](https://www.shoeisha.co.jp/book/detail/9784798145112)のサンプルコードを動かすために必要なRパッケージをインストールしています。

　

### tidymodels

`mlwr`をベースに`tidymodels`パッケージをインストールしたいのですが、以下の依存関係により関連パッケージとしてインストールされる`rstan`パッケージがdockerhub環境ではビルドできないため、`tidymodels`パッケージと`tidyposterior`パッケージを除いたパッケージをインストールします。

  - `tidymodels` imports `tidyposterior`  
  - `tidyposterior` imports `rstanarm`  
  - `rstanarm` imports
`rstan`

`tidymodels`パッケージが必要な場合はDockerfileを修正の上、ローカルビルドしてください。

　

#### tidymodels:full

`blogdown`をベースに`tidymodels`パッケージと依存パッケージすべてをローカルビルドでインストールしているバージョンです。ローカルビルドなので必ずしも`blogdown:latest`と同期がとれているとは限りません。

　

### blogdown

`tidymodels`をベースに`blogdown`パッケージとHugoの実行環境をインストールしています。Hugoテーマはインストールしていませんので別途`blogdown::install_theme`関数を利用してインストールしてください。  
なお、`C50`パッケージにはプロット関連のバグがあるため暫定的にGitHubの開発版もインストールしています。

　

## Usage

Dockerの導入に関しては省略しますが、使い方の基本は`rocker/*`と同じく **必ずパスワードを指定** してください。

``` bash
sudo docker -p 8787:8787 -v リンクさせたいローカルパス:/home/rstudio \
  -e PASSWORD=パスワード --name コンテナ名 kmetrics/イメージ名:タグ
```

| 設定項目          | 設定例          | 説明                                     |
| ------------- | ------------ | -------------------------------------- |
| リンクさせたいローカルパス | /home/user/R | 任意のローカルパス、Windowsの場合“/C/…”となる点に注意      |
| パスワード         | password     | 任意のパスワード                               |
| コンテナ名         | tidymodels   | 任意のコンテナ名称                              |
| イメージ名         | tidymodels   | jverse, mlwr, tidymodels, blogdownから選択 |
| :タグ           | :3.6.1       | 省略時は:latest                            |

　

## License

  - Dockerfiles are licensed under the GPL 2 or later.  
  - Other documents are licensed under “CC BY-NC-SA 4.0, Sampo Suzuki”
