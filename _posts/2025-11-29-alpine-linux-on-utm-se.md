---
layout: post
title: "iPadのUTM SE 上に Alpine Linux を導入する手順（全スクリーンショット付き）"
date: 2025-11-29 10:00:00 +0900
published: true
categories: [仮想化]
tags: [UTM SE, 仮想化, iPad, Alpine Linux]


### &nbsp;

---

## はじめに

この記事では、iPadのUTM SE上で軽量なLinuxディストリビューションであるAlpine Linuxを導入する手順を、全手順のスクリーンショット（全25枚）を交えて詳しく解説します。
画像と説明が一致している、正確な情報で更新しました。

## 私の環境

本記事の検証に使用した環境は以下の通りです。
- iPad Pro (M4)
- Magic Keyboard
- usb mouse

## インストール手順

それでは、早速インストール手順を見ていきましょう。



### &nbsp;

---

### 1. Alpine Linux 公式サイトのダウンロードページ

[https://alpinelinux.org/downloads/](https://alpinelinux.org/downloads/)

iPadで動かすUTMでは`aarch64`アーキテクチャが対応するため、`VIRTUAL`カテゴリの中から「aarch64」のISOイメージをダウンロードします。

![Alpine Linux ダウンロードページ]({{ site.baseurl }}/images/IMG_0413.jpeg)



### &nbsp;

---

### 2. UTMの「新規仮想マシンを作成」ボタン

UTMを起動し、新しい仮想マシンを作成するために、この「＋」ボタンをタップします。

![「新規仮想マシンを作成」ボタン]({{ site.baseurl }}/images/IMG_0414.jpeg)



### &nbsp;

---

### 3. 「新規マシン」作成オプション

テンプレートを使わずに、ゼロから仮想マシンを作成するため、「新規マシン」を選択します。

![「新規マシン」オプション]({{ site.baseurl }}/images/IMG_0415.jpeg)



### &nbsp;

---

### 4. OSの種類の選択

インストールするOSの種類として「Linux」を選択します。

![OSとして「Linux」を選択]({{ site.baseurl }}/images/IMG_0416.jpeg)



### &nbsp;

---

### 5. ハードウェアのExpert Mode設定

「Expert Mode」をオンにすると、アーキテクチャ、メモリ、CPUコア数などを詳細に設定できます。ここでは`aarch64`、メモリ`2048MB`、CPU`2コア`に設定しています。

![ハードウェアExpert Mode設定]({{ site.baseurl }}/images/IMG_0417.jpeg)



### &nbsp;

---

### 6. ディスプレイ出力設定

グラフィックに関する設定です。「ハードウェアOpenGLアクセラレーション」を有効にするか選択できます。

![ディスプレイ出力設定]({{ site.baseurl }}/images/IMG_0418.jpeg)



### &nbsp;

---

### 7. 起動イメージの種類の選択

Linuxをどうやって起動するかを選択します。新規インストールの場合は「Boot from ISO image」を選択し、「選択...」をタップしてISOファイルを探します。

![起動イメージの種類を選択]({{ site.baseurl }}/images/IMG_0419.jpeg)



### &nbsp;

---

### 8. 起動ISOイメージの指定完了

手順7で「選択...」をタップし、ダウンロードしておいたAlpine LinuxのISOイメージ (`alpine-virt-3.22.2-aarch64.iso`) を指定し終えた状態です。

![起動ISOイメージの指定完了]({{ site.baseurl }}/images/IMG_0420.jpeg)



### &nbsp;

---

### 9. ストレージサイズの設定

仮想マシンに割り当てるディスクのサイズを設定します。ここでは`10 GiB`に設定しています。

![ストレージサイズの設定]({{ site.baseurl }}/images/IMG_0421.jpeg)



### &nbsp;

---

### 10. 共有ディレクトリの設定

ホストOS（iPad）と仮想マシン（Alpine Linux）の間でファイルを共有するためのフォルダを指定できます。今回は設定せずに進みます。

![共有ディレクトリの設定]({{ site.baseurl }}/images/IMG_0422.jpeg)



### &nbsp;

---

### 11. 仮想マシンの概要確認と保存

これまでの設定内容を最終確認し、仮想マシンの名前（例: Alpine Linux ARM64）を入力して「保存」をタップします。

![概要確認と保存]({{ site.baseurl }}/images/IMG_0423.jpeg)



### &nbsp;

---

### 12. 仮想マシンの起動

UTMのメイン画面に作成された仮想マシンが表示されます。右側の「再生」ボタンをタップして仮想マシンを起動します。

![仮想マシンの起動]({{ site.baseurl }}/images/IMG_0424.jpeg)



### &nbsp;

---

### 13. Alpine Linux起動とログインプロンプト

仮想マシンが起動し、コンソールに「Welcome to Alpine Linux」のメッセージが表示され、ログインを促す `localhost login:` プロンプトが表示された状態です。

![Alpine Linux起動とログインプロンプト]({{ site.baseurl }}/images/IMG_0464_cropped.jpeg)



### &nbsp;

---

### 14. rootでのログイン成功

`root`と入力してログインに成功した直後の画面です。`setup-alpine`コマンドでセットアップを開始するよう案内が表示されています。

![rootでのログイン成功]({{ site.baseurl }}/images/IMG_0466_cropped.jpeg)



### &nbsp;

---

### 15. `setup-alpine` - キーボードレイアウト設定

`setup-alpine`コマンドを実行し、対話式セットアップが始まりました。最初の質問であるキーボードレイアウト（Keymap）で`jp`を選択しています。

![キーボードレイアウト設定]({{ site.baseurl }}/images/IMG_0467.jpeg)



### &nbsp;

---

### 16. `setup-alpine` - ホスト名・ネットワーク・rootパスワード設定

ホスト名を`alphost`に、ネットワーク(eth0)をDHCPに、そしてrootユーザーのパスワードを設定している場面です。

![ホスト名・ネットワーク・rootパスワード設定]({{ site.baseurl }}/images/IMG_0469_cropped.jpeg)



### &nbsp;

---

### 17. `setup-alpine` - タイムゾーン設定

システムのタイムゾーンを尋ねる質問に対し、`Japan`と入力して設定しています。

![タイムゾーン設定]({{ site.baseurl }}/images/IMG_0470.jpeg)



### &nbsp;

---

### 18. `setup-alpine` - プロキシ・NTP・ミラー設定

プロキシは無し、NTPクライアントは`busybox`、パッケージミラーは`1`（公式CDN）を選択しています。

![プロキシ・NTP・ミラー設定]({{ site.baseurl }}/images/IMG_0471_cropped.jpeg)



### &nbsp;

---

### 19. `setup-alpine` - 一般ユーザーの作成

`root`とは別の、普段使いの一般ユーザー（ここでは`lintaro`）を作成し、パスワードを設定しています。

![一般ユーザーの作成]({{ site.baseurl }}/images/IMG_0473_cropped.jpeg)



### &nbsp;

---

### 20. `setup-alpine` - ディスクインストールの完了

OSをディスク(`vda`)に`sys`モードでインストールする処理が完了した場面です。「Installation is complete. Please reboot.」と表示されています。

![ディスクインストールの完了]({{ site.baseurl }}/images/IMG_0476_cropped.jpeg)



### &nbsp;

---

### 21. インストール後のISOイメージ取り出し（作業前）

システムのシャットダウン後、UTMの仮想マシン設定画面に戻りました。CD/DVDドライブにインストール用ISOが挿入されたままになっています。

![ISOイメージ取り出し（作業前）]({{ site.baseurl }}/images/IMG_0481.jpeg)



### &nbsp;

---

### 22. インストール後のISOイメージ取り出し（作業後）

CD/DVDドライブからISOイメージを取り出し、「（空）」になった状態です。再起動する前に必ずこの作業が必要です。

![ISOイメージ取り出し（作業後）]({{ site.baseurl }}/images/IMG_0482.jpeg)



### &nbsp;

---

### 23. ディスクからの初回起動

ISOを取り外した後、UTMメイン画面で再度「再生」ボタンをタップし、ディスクにインストールされたOSを起動します。

![ディスクからの初回起動]({{ site.baseurl }}/images/IMG_0483.jpeg)



### &nbsp;

---

### 24. ディスク起動後のログインプロンプト

ディスクから正常にOSが起動しました。ログインプロンプトが、設定したホスト名`alphost login:`に変わっていることが確認できます。

![ディスク起動後のログインプロンプト]({{ site.baseurl }}/images/IMG_0484_cropped.jpeg)



### &nbsp;

---

### 25. 一般ユーザーでのログイン成功

作成した一般ユーザー`lintaro`でログインに成功した場面です。プロンプトが `alphost:~$` となっています。ここから`apk`コマンド等で好きなパッケージを導入していきます。

![一般ユーザーでのログイン成功]({{ site.baseurl }}/images/IMG_0485_cropped.jpeg)



### &nbsp;

---

## まとめ

これで、iPad上のUTM SEにAlpine Linuxの基本的なインストールは完了です。
ここから `apk` コマンドで好きなパッケージを導入し、自分だけの環境を構築していくことができます。お疲れ様でした！