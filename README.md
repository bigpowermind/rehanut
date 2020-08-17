# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# rehanut DB設計

##　contentsテーブル（コンテンツ機能）
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string||
|video|string||
### contents-Association
- has_many :users
- has_many :comments

## usersテーブル（ユーザー管理機能）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|email|string||
|password|string|null: false|
### users-Association
- has_many :contents
- has_many :comments

## commentsテーブル（コメント機能）
|Column|Type|Options|
|------|----|-------|
|body|text|null :false|
|user_id|integer|null :false, foreign_key: true|
### comments-Association
- belongs_to :user
- belongs_to :content