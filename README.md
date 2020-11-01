# README

# 概要

## アプリ名:RehaNut(リハニュート）
高齢者向け、在宅で行えるリハビリテーションアプリケーション。


# 開発状況

# 本番環境

# 動作確認方法

# DEMO

# 開発を通じて得られた知見


# rehanut DB設計

##  contentsテーブル（コンテンツ機能）
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string||
|video|string||
### contents-Association
- belongs_to :users
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
|comment|string|
|image|string|
|user_id|integer|null :false, foreign_key: true|
### comments-Association
- belongs_to :user
- belongs_to :content

## contents_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|content_id|integer|null: false, foreign_key: true|
### contents_users-Association
- belongs_to: user
- belongs_to: content
