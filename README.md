# README

# 概要

## アプリ名: RehaNut(リハニュート）
高齢者向け、在宅で行えるリハビリテーションアプリケーション。

## 誰のどんな問題を解決するのか（制作した経緯）
### 誰の
・日常生活が自立している高齢者（介護保険サービスが利用できない高齢者）  
・リハビリテーションを受けたくても受けられない高齢者  
・コロナ渦において自宅でリハビリテーション、トレーニングを行いたいと思っている高齢者
### どんな問題
在宅で行うリハビリテーション、トレーニングの方法がわからないこと。

### 達成したいゴール
高齢者が自宅にいてもリハビリテーションを受けられるようにすること。
また、一人一人にあった


現在、20~50歳代への在宅フィットネスに対するサービスは数多くあります。
しかし、高齢者向けの在宅フィットネスのようなサービスは少ないのが現状です。
また、リハビリテーション施設に通いリハビリテーションを受ける高齢者もいるものの、コロナ渦


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
