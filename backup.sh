#!/bin/bash

# ホームに戻る
cd ../../

# 設定file取得
. ./common.conf
TARGET_DIR="./minecraft_servers/${USE_SERVER}"

CURRENT_DATE=`date "+%Y%m%d-%H%M%S"`
BACKUPED_DIR="${CURRENT_DATE}_${USE_SERVER}"

7za a -mx=9 -t7z "${BACKUPED_PATH}${BACKUPED_DIR}.7z" "$TARGET_DIR"
