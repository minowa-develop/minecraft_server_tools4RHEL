#!/bin/bash

# 設定file読み込み
. ./common.conf

# method arg
METHOD=${1}
if [ ${#METHOD} -ne 0 ]; then
  echo "methodが入力されていません(start|stop|restart)"
  exit 1
fi

# setting arg
if [ ${#2} -ne 0 ]; then
  USE_SERVER=${2}
fi
echo "use server: ${USE_SERVER}"

# validate server
if [ ! -d "./minecraft_servers/${USE_SERVER}" ]; then
  echo "サーバ名: ${USE_SERVER}が存在しません、引数値、または、USE_SERVERを確認してください"
  exit 1
fi

cd "./minecraft_servers/${USE_SERVER}" || exit 1

# 種別判定(BE or Java)
if [ -e "server.jar" ]; then
  # java validate
  if [ ${#JAVA_PATH} -eq 0  ]; then
    JAVA_PATH="java"
  fi
  if ! ${JAVA_PATH} --version; then
    echo "javaコマンド、またはJAVA_PATHが設定されていません、javaのインストールかcommon.confのJAVA_PATHを設定してください"
    exit 1
  fi
else
  JAVA_PATH=""
fi

case "${METHOD}" in
  "start")
    if [ ${#JAVA_PATH} -eq 0 ]; then
      LD_LIBRARY_PATH=. ./bedrock_server
    else
      ${JAVA_PATH} -Xmx1024M -Xms1024M -jar server.jar nogui
    fi
    # backup
    cd ../../
    sh ./backup.sh "${USE_SERVER}"
    ;;
  "stop")
    if [ ${#JAVA_PATH} -eq 0 ]; then
      kill $(pgrep -f "bedrock_server")
    else
      kill $(pgrep -f "server.jar")
    fi
    ;;
  "restart")
    sh ./start_minecraft_server.sh "stop" "${2}"
    sh ./start_minecraft_server.sh "start" "${2}"
    exit 0
    ;;
  "*")
    echo "methodが不正です。method(start|stop|restart)を第一引数、サーバ名を第二引数にしてください。"
esac
