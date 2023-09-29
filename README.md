# データベース設計

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| delivery_cost  | string     | null: false                    |
| ship_from_area | string     | null: false                    |
| delivery_days  | string     | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| status           | string     | null: false                    |
| item             | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase