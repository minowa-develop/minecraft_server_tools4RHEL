#!/bin/bash

# 設定file取得
. ./common.conf
TARGET_DIR="./minecraft_servers/${USE_SERVER}"

CURRENT_DATE=`date "+%Y%m%d-%H%M%S"`
BACKUPED_NAME="${CURRENT_DATE}_${USE_SERVER}"

# if not exist backupdir
if [ ! -d ${BACKUP_PATH} ];then
  mkdir ${BACKUP_PATH}
fi

# backup
if [ ${#ZIP7_HOME} -ne 0 ];then
  7za a -mx=9 -t7z "${BACKUP_PATH}/${BACKUPED_NAME}.7z" "${TARGET_DIR}"
else
  zip -9 "${BACKUP_PATH}/${BACKUPED_NAME}.zip" -r "${TARGET_DIR}"
fi
