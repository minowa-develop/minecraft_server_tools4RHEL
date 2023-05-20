# java
JAVA_PATH=/home/mcserver/jdk-17.0.7+7/bin/java

# server名取得
. ./select_server.txt
# バックアップパス取得
. ./backup_path.txt

cd ./minecraft_servers/"$use_server"

# start minecraft server
$JAVA_PATH -Xmx1024M -Xms1024M -jar server.jar nogui

sh backup.sh $backup_path
