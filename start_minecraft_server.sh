#!/bin/bash

# 設定file読み込み
. ./common.conf

# setting arg
if [ ${#1} -ne 0 ]; then
  USE_SERVER=${1}
fi
echo "use server: ${USE_SERVER}"

# validate server
if [ ! -d "./minecraft_servers/${USE_SERVER}" ]; then
  echo "サーバ名: ${USE_SERVER}が存在しません、引数値、または、USE_SERVERを確認してください"
  exit 1
fi

cd "./minecraft_servers/${USE_SERVER}"

# 種別を取得してサーバを開始する
if [ -e "server.jar" ]; then
  # java validate
  if [ ${#JAVA_PATH} -eq 0  ]; then
    JAVA_PATH="java"
  fi
  ${JAVA_PATH} --version
  if [ $? -ne 0  ]; then
    echo "javaコマンド、またはJAVA_PATHが設定されていません、javaのインストールかcommon.confのJAVA_PATHを設定してください"
    exit 1
  fi
  nohup ${JAVA_PATH} -Xmx1024M -Xms1024M -jar server.jar nogui &
else
  LD_LIBRARY_PATH=. ./bedrock_server
fi

# backup
cd ../../
sh ./backup.sh "${USE_SERVER}"
