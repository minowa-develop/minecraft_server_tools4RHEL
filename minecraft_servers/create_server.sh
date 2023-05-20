# 引数がなければ異常終了
if [ $# -ne 1 ]; then
  echo "実行するには作成するサーバ名として引数が必要です。"
  exit 1
fi

# 作成するサーバ名
regist_server=$1

# serverディレクトリ作成
mkdir $regist_server
cd $regist_server

# serverデータをwebから取得する
template_dir="../.template/"
. $template_dir"bedrock_server_url.txt"
wget $bedrock_server_url
7za x $(basename $bedrock_server_url)

# 設定ファイルを複製する
conf_files=$template_dir"*"
cp $conf_files ./ --force -a

# サーバ名を変更
properties_file="server.properties"
sed -i -e "s/Dedicated Server/"$regist_server" Server/" $properties_file
