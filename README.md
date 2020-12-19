
# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   | null: false |

### Association

- has_many :habits
- has_many :rooms, through: room_users
- has_many :comments

## habitsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| exercise  | references | foreign_key: true              |
| daiet     | references | foreign_key: true              |
| learn     | references | foreign_key: true              |
| saving    | references | foreign_key: true              |
| mind      | references | foreign_key: true              |

### Association

- has_many :comments
- belongs_to :user
- belongs_to :exercise
- belongs_to :daiet
- belongs_to :learn
- belongs_to :saving
- belongs_to :mind
- has_one_attached :image

## exercisesテーブル

| Column | Type | Options | 
| ------ | ---- | ------- |
| ------ | ---- | ------- |

### Association

- has_many :habits

## daietsテーブル

| Column | Type | Options | 
| ------ | ---- | ------- |
| ------ | ---- | ------- |

### Association

- has_many :habits

## learnsテーブル

| Column | Type | Options | 
| ------ | ---- | ------- |
| ------ | ---- | ------- |

### Association

- has_many :habits

## savingsテーブル

| Column | Type | Options | 
| ------ | ---- | ------- |
| ------ | ---- | ------- |

### Association

- has_many :habits

## mindsテーブル

| Column | Type | Options | 
| ------ | ---- | ------- |
| ------ | ---- | ------- |

### Association

- has_many :habits

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| habit   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :habits


# Tumilog 概要

  3日坊主を治し習慣を作り切るアプリケーション

## URl(デプロイ後)

## テスト用アカウント(デプロイ後)

## 利用方法(実装後)

## 目指した課題解決

  20代後半から30代後半にかけて生活を改善したり、生活の質を高めたい人のために3日坊主などの悪癖との戦いから習慣を作るまでをサポートする

## 洗い出した要件(実装予定)

### ユーザー管理機能
 - 新規登録、ログイン機能
 - マイページ機能

### 投稿機能
 - 投稿一覧表示機能
 - 投稿詳細表示機能
 - 投稿編集機能
 - 投稿削除機能

### ルーム機能
 - カテゴリーごとに投稿する場所を分ける機能

### コメント機能
 - 投稿に対するコメントを行う(非同期通信)

## 実装した機能についてのGIFと説明(実装後)

## ローカルでの操作方法(実装後)

- Ruby version 2.6.5
- Data Base MySQL
