k-metrics docker container images
================

`rocker/verse` based docker container images for Machine Learning with
R.

　

# About this repository

　本リポジトリは
[データ分析勉強会](https://sites.google.com/site/kantometrics/2019)
でテキストとして利用している
[『Rによる機械学習』](https://www.shoeisha.co.jp/book/detail/9784798145112)
のサンプルコードが動かせる日本語ロケールのコンテナイメージを作成し公開しています。すべてのコンテナイメージは
[rocker](https://hub.docker.com/u/rocker) をベースとして使用しています。

　なお、公開しているコンテナイメージを使用することによって生じる、いかなる直接的・間接的損害について著作者ならびに勉強会運営者はいかなる責任・サポート義務を負いません。

　

# Container images

　以下のコンテナイメージを公開しています。DockerHubの規約変更によりすべてのイメージはマニュアルビルドになっています。最新ビルドが欲しい場合にはご自身の環境でビルドしてください。

| Image                                                      | Base image                                                      |     R3.6.x     |     R4.0.x     | R4.1.x<sup>4</sup> | Descriptions                                                                                       |
|------------------------------------------------------------|-----------------------------------------------------------------|:--------------:|:--------------:|:------------------:|----------------------------------------------------------------------------------------------------|
| [jverse](https://hub.docker.com/r/kmetrics/jverse)         | [rocker/verse](https://hub.docker.com/r/rocker/verse)           |      Yes       |      Yes       |        Yes         | Localizing into Japanese (Add Japanese fonts and locale) and useful R packages<sup>1</sup>         |
| [mlwr](https://hub.docker.com/r/kmetrics/mlwr)             | jverse                                                          |       No       |      Yes       |        Yes         | Add R packages for [Machine Learning with R](https://www.shoeisha.co.jp/book/detail/9784798145112) |
| [tidymodels](https://hub.docker.com/r/kmetrics/tidymodels) | mlwr                                                            |       No       |      Yes       |        Yes         | Add `tidymodels` package                                                                           |
| [blogdown](https://hub.docker.com/r/kmetrics/blogdown)     | tidymodels                                                      |       No       | No<sup>2</sup> |   No<sup>2</sup>   | Add `blogdown` package and Hugo executable                                                         |
| keras                                                      | [rocker/tensorflow](https://hub.docker.com/r/rocker/tensorflow) | No<sup>3</sup> | No<sup>3</sup> |   No<sup>3</sup>   | Discontinued                                                                                       |

<sup>1</sup> 3.6.x images NOT include useful R packages  
<sup>2</sup> rocker/verse:4.x.x and latest include `blogdown` package
and Hugo executable  
<sup>3</sup> rocker/tensorflow no longer update  
<sup>4</sup> 4.1.x images include `reticulate` package and
[miniconda](https://docs.conda.io/en/latest/miniconda.html) 　

# Usage

　Dockerの導入に関しては省略しますが、使い方は `rocker/*` と同じで
**必ずパスワードを指定**
してください。Dockerコンテナの起動については『[Run your image as a
container, Docker
Docs](https://docs.docker.com/get-started/part2/)』を参照してください。

``` bash
sudo docker run -p 8787:8787 -v リンクするローカルパス:/home/rstudio/project \
  -e PASSWORD=パスワード --name コンテナ名 kmetrics/イメージ名:タグ
```

| 設定項目               | 設定例     | 説明                                                 |
|------------------------|------------|------------------------------------------------------|
| リンクするローカルパス | \~/R       | 任意のローカルパス<sup>4</sup>                       |
| パスワード             | password   | 任意のパスワード                                     |
| コンテナ名             | tidymodels | 任意のコンテナ名称（`--name`オプションは省略可です） |
| イメージ名             | tidymodels | 実行させたいイメージ名                               |
| タグ                   | 4.1.1      | 省略時は`latest`を指定したものと解釈されます         |

<sup>4</sup> Windowsの場合 `/DriveLetter/Directory/...`
と指定してください。`DriveLetter:` というドライブ名は使えません。

　

## Home directory (Docker side)

　ログイン名は `rocker/*` と同じく `rstudio`
ですのでホームディレクトリは `/home/rstudio`
となります。ホームディレクトリ配下には以下のサブディレクトリを配置しています。

| サブディレクトリ名 | 用途など                                                               |
|--------------------|------------------------------------------------------------------------|
| kitematic          | コンテナ管理用ディレクトリ（RStudio Server 1.2 Only）                  |
| project            | プロジェクト用ディレクトリ（ローカルパスのリンクポイント）             |
| sample             | サンプルファイル<sup>5</sup>（スクリプト、データなど）格納ディレクトリ |

<sup>5</sup> 順次提供予定

　

## RStudio Preferencehi

　`4.x.x` タグならびに `latest`
タグのコンテナイメージではRStudioの設定をデフォルトから変更しています。設定ファイルは
`rstudio-prefs.json`
で、好みに応じて変更することが可能です。変更した場合は `jverse`
から順次ビルドし直すかDockerfileを変更してビルドし直してください。なお、設定項目の詳細については[こちら](https://docs.rstudio.com/ide/server-pro/1.3.820-1/session-user-settings.html#session-user-settings)を参照してください。

　

# Reference

-   [rocker](https://hub.docker.com/u/rocker)
-   [rocker-org](https://github.com/rocker-org)
-   [tokyor/rstudio](https://hub.docker.com/r/tokyor/rstudio)
-   [RStudio Package Manager](https://packagemanager.rstudio.com/)
-   [Package \`reticulate\`\`](https://rstudio.github.io/reticulate/)

　

# License

-   Dockerfiles are licensed under the GPL 2 or later.  
-   Other files are licensed under CC BY-NC-SA 4.0, Sampo Suzuki
