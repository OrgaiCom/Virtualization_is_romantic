---
layout: post
title: "iPadのUTM SE 上に Alpine Linux を導入する手順（全スクリーンショット付き）"
date: 2025-11-29 10:00:00 +0900
published: false
categories: [仮想化]
tags: [UTM SE, 仮想化, iPad, Alpine Linux]
---

## はじめに

この記事では、iPadのUTM SE上で軽量なLinuxディストリビューションであるAlpine Linuxを導入する手順を、全手順のスクリーンショットを交えて詳しく解説します。

## 1. Alpine Linux のイメージを準備

まず、[Alpine Linuxの公式サイト](https://alpinelinux.org/downloads/)から、**aarch64**版のISOイメージをダウンロードします。`alpine-virt-`で始まるファイル名が仮想マシン向けです。

![Alpine Linux公式サイトのダウンロードページ。aarch64版を選択。]({{ site.baseurl }}/images/IMG_0413.jpeg)

ダウンロードしたISOファイルは、iPadの「ファイル」アプリ内の分かりやすい場所に保存しておきます。

## 2. UTM SE で仮想マシンを作成

次に、UTM SEアプリでAlpine Linuxをインストールするための仮想マシンを新規作成します。

1.  UTM SEを起動し、右上の「+」ボタンをタップして新規仮想マシンを作成します。
    ![UTM SEのメイン画面。「+」をタップして新規仮想マシンを作成。]({{ site.baseurl }}/images/IMG_0414.jpeg)

2.  実行方法として「仮想化」を選択します。
    ![新規マシン作成の選択肢で「仮想化」を選択。]({{ site.baseurl }}/images/IMG_0415.jpeg)

3.  OSの種類として「Linux」を選択します。
    ![仮想マシンのOSとして「Linux」を選択。]({{ site.baseurl }}/images/IMG_0416.jpeg)

4.  「起動ISOイメージ」の「選択」をタップし、手順1で保存したAlpine LinuxのISOファイルを選択します。
    ![起動ISOイメージとしてダウンロードしたAlpine LinuxのISOファイルを選択。]({{ site.baseurl }}/images/IMG_0417.jpeg)

5.  ハードウェアリソースを設定します。今回はメモリ2GB、CPUコア2、ストレージ10GBとしました。
    ![仮想マシンのメモリ、CPUコア数、ストレージ容量を設定。]({{ site.baseurl }}/images/IMG_0418.jpeg)

6.  ホストOSとの共有ディレクトリを設定できますが、今回はスキップします。「次へ」をタップします。
    ![共有ディレクトリは任意で設定。今回はスキップ。]({{ site.baseurl }}/images/IMG_0419.jpeg)

7.  仮想マシンの名前を入力し（例: Alpine）、右上の「保存」をタップします。
    ![作成する仮想マシンの名前を入力し、「保存」をタップ。]({{ site.baseurl }}/images/IMG_0420.jpeg)

8.  メイン画面に作成した仮想マシンが表示されたら、起動ボタン（▶）をタップして起動します。
    ![メイン画面に戻り、作成した「Alpine」VMを起動。]({{ site.baseurl }}/images/IMG_0421.jpeg)

## 3. Alpine Linux のインストール

仮想マシンが起動したら、いよいよAlpine Linuxをストレージにインストールします。

1.  コンソールが表示されたら、`localhost login:` に続けて `root` と入力し、Enterキーを押します。（初回はパスワード不要）
    ![仮想マシン起動後、rootユーザーでログイン。]({{ site.baseurl }}/images/IMG_0422.jpeg)

2.  ログイン後、`setup-alpine` と入力してインストーラーを起動します。
    ![setup-alpineコマンドでインストールを開始。]({{ site.baseurl }}/images/IMG_0423.jpeg)

3.  **キーボードレイアウトの設定**: `jp` と入力します。
    ![キーボードレイアウトの選択で「jp」を入力。]({{ site.baseurl }}/images/IMG_0424.jpeg)
    再度 `jp` を入力して確定します。
    ![キーボードバリアントの選択で再度「jp」を入力。]({{ site.baseurl }}/images/IMG_0464.jpeg)

4.  **ホスト名の設定**: 好きなホスト名を入力します（例: `alphost`）。
    ![ホスト名の設定で「alphost」を入力。]({{ site.baseurl }}/images/IMG_0466.jpeg)

5.  **ネットワークの設定**: `eth0` を選択し（デフォルト）、DHCPで自動設定します。
    ![ネットワークインターフェースの選択。]({{ site.baseurl }}/images/IMG_0467.jpeg)

6.  **rootパスワードの設定**: rootユーザーの新しいパスワードを入力します。
    ![rootパスワードの設定。]({{ site.baseurl }}/images/IMG_0469.jpeg)

7.  **タイムゾーンの設定**: `Asia/Tokyo` または `Japan` を選択します。
    ![タイムゾーンの選択。]({{ site.baseurl }}/images/IMG_0470.jpeg)

8.  **ディスクの選択**: インストール先ディスクとして `vda` を選択します。
    ![インストール先ディスクとして「vda」を選択。]({{ site.baseurl }}/images/IMG_0471.jpeg)

9.  **インストールモードの選択**: どのようにディスクを使用するか問われます。`sys` を選択してディスク全体にインストールします。
    ![インストールモードとして「sys」を選択。]({{ site.baseurl }}/images/IMG_0473.jpeg)
    `Erase the above disk(s) and continue?` と確認されるので、`y` を入力します。

10. インストールが完了したら、`poweroff` コマンドで仮想マシンをシャットダウンします。
    ![インストール完了後、poweroffコマンドでシャットダウン。]({{ site.baseurl }}/images/IMG_0476.jpeg)

## 4. インストール後の初回起動

1.  UTM SEの仮想マシンの設定画面を開き、CD/DVDドライブからISOイメージを取り外します（ドライブをクリア）。
    ![設定画面でISOイメージを取り外し。]({{ site.baseurl }}/images/IMG_0481.jpeg)

2.  再度仮想マシンを起動します。今度はストレージからAlpine Linuxが起動します。
    ![ISO取り外し後、再度仮想マシンを起動。]({{ site.baseurl }}/images/IMG_0482.jpeg)

3.  先ほど設定した `root` のパスワードでログインします。
    ![設定したrootパスワードでログイン。]({{ site.baseurl }}/images/IMG_0483.jpeg)

4.  ログイン後、例えば `apk update` を実行して、パッケージリストが更新できることを確認します。
    ![ログイン後、apk updateを実行して動作確認。]({{ site.baseurl }}/images/IMG_0484.jpeg)

これで、iPad上のUTM SEにAlpine Linuxのインストールは完了です。お疲れ様でした！
![最終的なコンソール画面。]({{ site.baseurl }}/images/IMG_0485.jpeg)

---
