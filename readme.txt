サーバの開始やバックアップの作成、サーバ作成を簡単にするシェルなどです。

- select_server.txt
  サーバディレクトリ名を記載してください。

- start_minecraft_server.sh
  select_server.txtで指定したサーバを開始します
  実行例) sh server_minecraft_server.sh

- backup_minecraft_server.sh
  select_server.txtで指定したサーバのバックアップを取ります。
  バックアップ先はbachup_pash.txtで指定したパスが対象
  実行例) sh backup_minecraft_server.sh

- minecraft_servers/create_server.sh
  新しくサーバを作成します。引数に新規のサーバ名を入力してください。
  実行例) sh create_server.sh new_server

- minecraft_servers/.template/bedrock_server_url.txt
  新しくサーバを作成する際にダウンロードするminecraft_serverのURLを記載してください。
  バージョンアップの際に変更する必要があります。下記の公式ページにて適宜確認してください。
  https://www.minecraft.net/ja-jp/download/server/bedrock

- minecraft_servers/.template/各ファイル
  新しくサーバを作成する際に上書きをするファイルです。
  allowlist.json,server.propertiesが使い回せる設定が多いと思うのでdefaultで設定済み。適宜この２つは削除しても良い