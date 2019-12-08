How to setup
================

[jupyter/datascience-notebook
<i class="fa fa-external-link"></i>](https://hub.docker.com/r/jupyter/datascience-notebook)
に日本語ロケールと日本語フォントを追加したコンテナイメージです。matplotlibの豆腐文字問題は解決できていません。

　

# How to boot

`-d`オプションで起動するためにはひと手間必要です。

1.  ダウンロード
2.  パスワード用ハッシュの取得
3.  起動

なお、Docker自体の環境構築については省略します。

　

# ダウンロード

ターミナルから`docker
pull`コマンドを利用して目的のコンテナイメージをダウンロードします。展開前で2GB弱ありますので通信環境にはご注意ください。

``` bash
docker pull kmetrics/jupyter
```

　

# パスワード用ハッシュの取得

コンテナイメージを起動する前にパスワード用のハッシュを取得しておきます。ハッシュはコンテナイメージ起動時に必要となりますので、必ずメモしておいてください。  
まず、ターミナルから`docker`コマンドを利用してコンテナイメージ内の`bash`シェルを起動します。

``` bash
docker run -it --rm kmetrics/jupyter /bin/bash
```

`bash`シェルが起動するとコマンドプロンプトが以下のように表示されます。`jovyan@`以降の英数時は環境により異なります。

``` bash
jovyan@4x2955h4p91g:~$
```

次に`python`を利用してパスワード用ハッシュを取得します。

``` bash
jovyan@4x2955h4p91g:~$ python -c 'from notebook.auth import passwd;print(passwd())'
```

上記のコマンドを実行するとパスワードを訪ねられますので、jupyter notebookにログインするためのパスワードを入力してください。

``` bash
Enter password:
Verify password:
```

パスワードを二回入力するとSHA1のハッシュが表示されますので、必ずメモしてください。

``` bash
sha1:（ハッシュ）
```

ハッシュをメモしたら`exit`コマンドで`bash`シェルから抜け出します。

``` bash
jovyan@4x2955h4p91g:~$ｘ exit
```

　

# 起動

パスワード用のハッシュが入手できましたので、`docker
run`コマンドを利用してコンテナイメージを起動します。作成したファイルなどをローカルに保存できるように`-v`オプションで任意のローカルフォルダをコンテナイメージ側にマウントしておきます。

``` bash
docker run -d -p 8888:8888 --name {NAME} -v {LDIR}:/home/jovyan/work \
   kmetrics/jupyter start-notebook.sh --NotebookApp.password={SHA1}
```

| option                              | description                     |
| ----------------------------------- | ------------------------------- |
| –name {NAME}                        | 任意のコンテナ名を指定します                  |
| \-v {LDIR}                          | マウントするローカルフォルダのパス（フルパス推奨）を指定します |
| –NotebookApp.password=‘sha1:{SHA1}’ | 事前に取得したハッシュを指定します               |

コンテナが起動したらブラウザから`localhost:8888`にアクセスするとログイン画面が表示されますので、パスワード用ハッシュを取得した時に使ったパスワードでログインしてください。

　

# Makefile

以下のような`Makefile`を作成して`make`コマンドで実行することでコンテナの起動や停止が簡単になります。

    IMAGE := kmetrics/jupyter
    TAG := latest
    LDIR := （任意のローカルパス）
    NAME := （任意のコンテナ名）
    SHA1 := 'sha1:（取得したハッシュ）'
    
    pull:
        docker pull ${IMAGE}:${TAG}
    
    run:
        docker run -d -p 8888:8888 --name ${NAME} -v ${LDIR}:/home/jovyan work$ \
        {IMAGE}:${TAG} start-notebook.sh --NotebookApp.password=${SHA1}
    
    stop:
        docker stop ${NAME}

　

# 参考情報

  - [how to enable a password
    <i class="fa fa-external-link"></i>](https://jupyter-notebook.readthedocs.io/en/stable/public_server.html)
  - [Dockerで基本的なData Science環境(Jupyter, Python, R, Julia, 定番ライブラリ)を構築する。
    <i class="fa fa-external-link"></i>](https://qiita.com/y4m3/items/c2703d4e131e05084b7b)

-----

**enjyoy\!**
