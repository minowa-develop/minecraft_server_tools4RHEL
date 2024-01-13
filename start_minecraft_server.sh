#!/bin/bash

# 設定file読み込み
. ./common.conf

cd "./minecraft_servers/${USE_SERVER}"

# 種別を取得してサーバを開始する
if [ -e "server.jar" ]; then
  # java validate
  if [ ${#JAVA_PATH} -eq 0  ];then
    JAVA_PATH="java"
  fi
  ${JAVA_PATH} --version
  if [ $? -ne 0  ];then
    echo "javaコマンド、またはJAVA_PATHが設定されていません、javaのインストールかcommon.confのJAVA_PATHを設定してください"
    exit 1
  fi
  ${JAVA_PATH} -Xmx1024M -Xms1024M -jar server.jar nogui
else
  LD_LIBRARY_PATH=. ./bedrock_server
fi

# backup
cd ../../
sh ./backup.sh
