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

　

# Container images

　以下のコンテナイメージを公開しています。

| Image      | Base image   |      R3.6.x      | R4.0.x | Descriptions                                                                                       |
| ---------- | ------------ | :--------------: | :----: | -------------------------------------------------------------------------------------------------- |
| jverse     | rocker/verse |       Yes        |  Yes   | Localizing into Japanese (Add Japanese fonts and locale)                                           |
| mlwr       | jverse       |       Yes        |  Yes   | Add R packages for [Machine Learning with R](https://www.shoeisha.co.jp/book/detail/9784798145112) |
| tidymodels | mlwr         | Yes<sup>\*</sup> |  Yes   | Add `tidymodels` package                                                                           |
| blogdown   | tidymodels   |       Yes        |  Yes   | Add `blogdown` package and Hugo executable                                                         |

<sup>\*</sup> Build manually

　

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
