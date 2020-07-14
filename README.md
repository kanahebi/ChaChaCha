# 環境構築
1. `dip` をMacにインストールする
2. `cp .env.sample .env` を実行する
3. `dip provision` を実行する
4. `dip bundle install` を実行する
5. `dip yarn install --check-files` を実行する
6. `dip rails db:create` を実行する
7. `dip rails ridgepole:apply` を実行するこれまだしない

# アプリの起動
`dip up` を実行する

http://localhost:3000
