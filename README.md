# このアプリについて
  - フィヨルドブートキャンプというプログラミングスクールで作成したSinatraのメモアプリです。
  - 簡単なメモの新規投稿、一覧表示、編集、削除ができます。
# アプリ立ち上げ方法
## git clone
作業したいローカルフォルダに移動します。
`git clone https://github.com/cest-megu/sinatra_app.git`
を実行します。

## アプリの立ち上げについて
- `sinatra_app`のディレクトリに移動します。
- アプリ立ち上げのため、必要なgemファイルをインストールするために、
```
bundle install --path vendor/bundle
```
を実行します。

- アプリを立ち上げます

```
bundle exec ruby main.rb
```
を実行します。

- ブラウザを開いて、`localhost:4567/memos`にアクセスできればメモアプリが使用できます。

## 投稿したメモの保存先
  新規投稿したメモは、`memos`ディレクトリに自動的にjsonファイルとして保存されます。
