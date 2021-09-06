# README

# アプリ名

ourblog

# 概要

・いいね機能からお気に入りの本をいいねできる機能
・問い合わせフォームからメールを送信する機能
・詳細よりコメント欄にてコメントを残せる機能
・一覧より今までの登録者と投稿内容を確認できます。
・検索から今までの投稿内容を確認できる機能

# 本番環境

URL 35.74.224.200
テスト用アカウント admin 2222 pochi.com777@gmail.com

# 制作背景

本というのは先人の経験や知識が大量に詰まったものになるので、大抵の悩みは本が解決してくれることもあると思います。
そんな自分の人生や価値観を大きく変えることになったきっかけの本をお互いに紹介しあうことでどこがどんなふうによくて、具体的にこれからどういう行動や考え方をするようになったのかをみんなで共有しあうことで、価値観を高め合うことができれば、一層充実した人生を過ごせるかと思ったのでそういった思いで作成しました。

# DEMO

[![Image from Gyazo](https://i.gyazo.com/6a13514c5d33d770b682bf7709f8c515.jpg)](https://gyazo.com/6a13514c5d33d770b682bf7709f8c515)

# 工夫したポイント

・カリキュラムを参照にしながらではありますがコメント機能や検索機能を過去の経験を活かしてオリジナルアプリに実装できた点
・いいね機能やメールの問い合わせ機能は未知の部分ではありましたが、実際にいろんな記事を参照している中でこの部分を変更したら実装できそうというところをトライアンドエラーの繰り返しで無事実装できた点

# 使用技術(開発環境)

バックエンド　　 Ruby,Ruby on Rails
フロントエンド HTML,Saas,Bootstrap
データベース MriaDB(Mysql),Squelpro
インフラ AWS(EC2),Capistrano
web サーバー nginx
アプリケーションサーバー unicorn
ソース管理 github,githubdesktop
テスト rspec
エディタ VScode

# 課題や今後実装したい機能

・レイアウトがフレームワークに頼りきりになってしまっているので、自分の力で CSS などを利用してフォームなどを整えていきたいと思っています。
・コメントをくれた人に対しての通知機能やフォロー機能を取り入れられたらとは考えています。

# DB 設計

## users テーブル

| Column             | Type    | Options 　                |
| ------------------ | ------- | ------------------------- |
| username           | string  | null: false 　            |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false 　            |
| profile            | text    | null: false 　            |
| profile_image_id   | integer | 　                        |

### Association

has_many :blogs
has_many :comments

## blogs テーブル

| Column   | Type       | Options 　       |
| -------- | ---------- | ---------------- |
| title    | string     | null: false 　   |
| body     | string     | null: false      |
| image_id | integer    |                  |
| user_id  | references | foreign_key:true |

### Association

has_many :comments
belongs_to :user

## comments テーブル

| Column  | Type       | Options 　       |
| ------- | ---------- | ---------------- |
| text    | string     | null: false 　   |
| user_id | references | foreign_key:true |
| blog_id | references | foreign_key:true |

### Association

belongs_to :user
belongs_to :blog

## contacts テーブル

| Column  | Type       | Options 　       |
| ------- | ---------- | ---------------- |
| name    | string     | null: false 　   |
| user_id | references | foreign_key:true |
| email   | string     | null: false      |
| content | text       | null: false      |

### Association

belongs_to :user

## favorites テーブル

| Column  | Type       | Options 　       |
| ------- | ---------- | ---------------- |
| name    | string     | null: false 　   |
| user_id | references | foreign_key:true |

### Association

belongs_to :user
belongs_to :blog
