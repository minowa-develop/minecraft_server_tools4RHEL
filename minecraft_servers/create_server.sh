#!/bin/bash

# 引数がなければ異常終了
if [ $# -eq 0 ] || [ $# -gt 2 ]; then
  echo "実行するには作成するサーバ名として引数が必要です。第2引数があるとjava版となります"
  exit 1
fi

# 設定file読み込み
. ../common.conf

# 作成するサーバ名
regist_server=$1

# serverディレクトリ作成
mkdir "$regist_server"
cd "$regist_server" || exit 1

# get server module
if [ $# -eq 2 ]; then
  curl "$JAVA_SERVER_URL" -OL
  echo "eula=true" > eula.txt
else
  DL_FILE="server.zip"
  curl "$BEDROCK_SERVER_URL" > $DL_FILE
  unzip $DL_FILE
  # サーバ名を変更
  sed -i -e "s/Dedicated Server/${regist_server} Server/" server.properties
fi
