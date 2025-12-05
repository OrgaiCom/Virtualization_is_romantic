#!/bin/bash

echo "Jekyllサイトをビルドしています..."
bundle exec jekyll build

if [ $? -eq 0 ]; then
  echo "ビルドが成功しました。ポート4000でプレビューサーバーを起動します。"
  bundle exec jekyll serve --port 4000
else
  echo "ビルドに失敗しました。エラーを確認してください。"
  exit 1
fi