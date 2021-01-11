# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    | ハイフン必須
| delivery_area_id | integer    | null: false                    | ActiveHash
| municipality     | string     | null: false                    |
| block_number     | string     | null: false                    |
| building_name    | string     |                                |
| tel              | string     | null: false                    | 11桁以内、ハイフン不要
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to:order

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| condition_id     | integer    | null: false                    | ActiveHash
| category_id      | integer    | null: false                    | ActiveHash
| shipping_id      | integer    | null: false                    | ActiveHash
| delivery_area_id | integer    | null: false                    | ActiveHash
| days_to_ship_id  | integer    | null: false                    | ActiveHash
| price            | integer    | null: false                    | ¥300~¥9,999,999半角数字
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
