サーバ開始やバックアップの作成、サーバ作成を簡単にするシェルなどです
事前にポートを許可する必要があります、BEDROCK版:19132,JAVA版:25565

- common.conf
  設定する項目が記載されています。初期設定のために必要な項目があるので記載してください
  JAVA_PATH: Java版のみ使用します、Javaのパスを指定してください、空白値の場合はjavaコマンドを使用します
  USE_SERVER: 使用するサーバ名
  BACKUP_PATH: バックアップ先のパス
  ZIP7_HOME: 7zipのパス,記載していればバックアップ時に使用し、記載無しの場合はzipで圧縮する
  BEDROCK_SERVER_URL: BE版のサーバモジュールをダウンロードするURL(※1)
  JAVA_SERVER_URL: Java版のサーバモジュールをダウンロードするURL(※1)

  ※1 バージョンアップの際に変更する必要があります。サーバモジュールの最新は下記のURLで適宜変更してください
    BE: https://www.minecraft.net/ja-jp/download/server/bedrock
    java: https://www.minecraft.net/ja-jp/download/server

- start_minecraft_server.sh
  USE_SERVERで指定したサーバを開始します、stopで終了した際、バックアップをとります
  実行例) sh server_minecraft_server.sh

- minecraft_servers/create_server.sh
  新しくサーバを作成します。第1引数に新規のサーバ名を入力してください。
  第2引数をなにか入力した際はJava版となります。
  bedrock版 実行例) sh create_server.sh new_server
  java版 実行例) sh create_server.sh new_server tekito-
