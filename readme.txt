readme.txt
サーバ開始やバックアップの作成、サーバ作成を簡単にするシェルなどです
7zipを使用するためインストールをお願いします。バックアップ時に使用します。

- common.conf
  設定する項目が記載されています。初期設定のために必要な項目があるので記載してください
  JAVA_PATH: Java版のみ使用します、Javaのパスを指定してください
  USE_SERVER: 使用するサーバ名
  BACKUP_PATH: バックアップ先のパス
  BEDROCK_SERVER_URL: BE版のサーバモジュールをダウンロードするURL
  JAVA_SERVER_URL: Java版のサーバモジュールをダウンロードするURL
  ※ バージョンアップの際に変更する必要があります。サーバモジュールの最新は下記のURLで適宜変更してください
  java: https://www.minecraft.net/ja-jp/download/server
  BE: https://www.minecraft.net/ja-jp/download/server/bedrock

- start_minecraft_server.sh
  USE_SERVERで指定したサーバを開始します、stopで終了した際、バックアップをとります
  実行例) sh server_minecraft_server.sh

- minecraft_servers/create_server.sh
  新しくサーバを作成します。第1引数に新規のサーバ名を入力してください。
  第2引数をなにか入力した際はJava版となります。
  実行例) sh create_server.sh new_server
