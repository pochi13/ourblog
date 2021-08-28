# README

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
