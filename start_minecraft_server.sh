#!/bin/bash

# 設定file読み込み
. ./common.conf

cd "./minecraft_servers/${USE_SERVER}"

# 種別を取得してサーバを開始する
if [ -e "server.jar" ]; then
  if [ ${#JAVA_PATH} -eq 0  ];then
    echo "JAVA_PATHが設定されていません、common.confのJAVA_PATHを設定してください"
    exit 1
  fi
  ${JAVA_PATH}/java -Xmx1024M -Xms1024M -jar server.jar nogui
else
  LD_LIBRARY_PATH=. ./bedrock_server
fi

# backup
sh ../../backup.sh "${BACKUP_PATH}" "minecraft_servers/${USE_SERVER}"
