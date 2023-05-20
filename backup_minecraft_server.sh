# server名取得
. ./select_server.txt
# バックアップパス取得
. ./backup_path.txt

cd ./minecraft_servers/"$use_server"
sh backup.sh $backup_path
