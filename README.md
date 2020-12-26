
# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   | null: false |

### Association

- has_many :exercises
- has_many :daiets
- has_many :larns
- has_many :savings
- has_many :minds
- has_many :exercise_comments
- has_many :daiet_comments
- has_many :learn_comments
- has_many :saving_comments
- has_many :mind_comments
- has_many :early_comments

## exercisesテーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: ture |

### Association

- has_many :exercise_commets
- belongs_to :user

## daietsテーブル


| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: ture |

### Association

- hab_many :daiet_comments
- belongs_to :user

## learnsテーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: ture |

### Association

- has_many :learn_comments
- belongs_to :user

## savingsテーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: ture |

### Association

- has_many :saving_comments
- belongs_to :user

## mindsテーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: ture |

### Association

- has_many :mind_commetns
- belongs_to :user

## earliesテーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: ture |

### Association

- has_many :early_comments
- belongs_to :user

## exercise_commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| exercise   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :exercise

## daiet_commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| daiet   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :daiet

## learn_commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| learn   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :learn

## saving_commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| saving  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :saving

## mind_commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| mind    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :mind

## early_commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| early   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :early


# Tumlog 概要

  3日坊主を治し習慣を作り切るアプリケーション

## URl(デプロイ後)

## テスト用アカウント(デプロイ後)

## 利用方法

  継続・築きたい習慣のカテゴリーを選択し、各カテゴリーで習慣についての投稿をする、習慣化の掲示板アプリ
  自分のための投稿だけでなく、お互いにコメントできるなどコミュニケーションを取れるなど、主に掲示板として利用する

## 目指した課題解決

  20代後半から30代後半にかけて生活を改善したり、生活の質を高めたい人のために3日坊主などの悪癖との戦いから習慣を作るまでをサポートする

## 洗い出した要件

### ユーザー管理機能
 - 新規登録、ログイン機能
 - マイページ機能

### 投稿機能
 - 投稿一覧表示機能
 - 投稿詳細表示機能
 - 投稿編集機能
 - 投稿削除機能

### カテゴリー選択機能
 - カテゴリーごとに投稿する場所を分ける機能

### コメント機能
 - 投稿に対するコメントを行う機能

### 画像プレビュー機能
 - 画像をプレビュー表示する機能

## 実装した機能についてのGIFと説明(実装後)

## ローカルでの操作方法(実装後)

- Ruby version 2.6.5
- Data Base MySQL
