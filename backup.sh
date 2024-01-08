#!/bin/bash

# ホームに戻る
cd ../../

# 設定file取得
. ./common.conf
TARGET_DIR="./minecraft_servers/${USE_SERVER}"

CURRENT_DATE=`date "+%Y%m%d-%H%M%S"`
BACKUPED_DIR="${CURRENT_DATE}_${USE_SERVER}"

if [ ${#ZIP7_HOME} -ne 0 ];then
  7za a -mx=9 -t7z "${BACKUPED_PATH}${BACKUPED_DIR}.7z" "$TARGET_DIR"
else
  zip -9 "${BACKUPED_PATH}${BACKUPED_DIR}.zip" -r "$TARGET_DIR"
fi
