# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :addresses
- has_many :items
- has_many :orders

## addresses テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| postal_code   | string  | null: false                    | ハイフン必須
| prefectures   | string  | null: false                    | ActiveHash
| municipality  | string  | null: false                    |
| block_number  | string  | null: false                    |
| building_name | string  |                                |
| tel           | integer | null: false                    | 11桁以内、ハイフン不要

### Association

- belongs_to :user
- has_one :order

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| product_condition   | string     | null: false                    | ActiveHash
| category            | string     | null: false                    | ActiveHash
| shipping            | integer    | null: false                    | ActiveHash
| delivery_area       | string     | null: false                    | ActiveHash
| days_to_ship        | integer    | null: false                    | ActiveHash
| price               | integer    | null: false                    | ¥300~¥9,999,999半角数字
| seller              | references | null: false, foreign_key: true |
| image               | active storage

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| price          | references | null: false, foreign_key: true |
| buyer          | references | null: false, foreign_key: true |
| delivery_area  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address
- belongs_to :item
