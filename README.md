# README

アプリケーション ourblog

アプリケーション概要 自分の好きな本を紹介してどこがどんなふうによくて、具体的にどういう行動や考え方をするようになったのかをみんなで共有しあうことで、価値観を高め合うことができます。

URL 35.74.224.200

テスト用アカウント admin 2222 pochi.com777@gmail.com

利用方法 user 登録していただき、画像とタイトルや内容を記入し、投稿をする。また、一覧から全ての投稿が確認できるので詳細表示をし、そこからいいねやコメントも入力が可能。なお、一覧にあるタイトルはナビバーの検索から検索することも可能

目指した課題解決 思い悩んだ時などどうしても考え方が閉鎖的になったりする場面が誰しもあると思います。そういった時に視野を広げて行動してみるということを皆さんのおすすめの本を通じて共有しあって欲しいと思ってます。

実装した機能についての画像や GIF およびその説明 [![Image from Gyazo](https://i.gyazo.com/6a13514c5d33d770b682bf7709f8c515.jpg)](https://gyazo.com/6a13514c5d33d770b682bf7709f8c515)
投稿者一覧 新規登録していただいたユーザーの一覧を確認できます。
マイページ ご自身のプロフィールと過去に投稿した内容を閲覧できます。尚、自身の内容はそこから編集も可能です。
投稿一覧 全てのユーザーが今まで投稿した内容を閲覧できます。詳細画面ではいいねやコメントを残せます。
新規投稿 新規におすすめしたい本を投稿できます。

実装予定の機能 レイアウトをもう少し整えたい

データベース設計 ER 図等を添付。

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

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
