# テーブル設計

## users テーブル

| Column           | Type      | Options     |
| --------         | ------    | ----------- |
| nickname         | string    | null: false |
| email            | string    | null: false |
| password         | string    | null: false |
| first_name       | string    | null: false |
| last_name        | string    | null: false |
| first_name_kana  | string    | null: false |
| last_name_kana   | string    | null: false |
| birthday         | references| null: false |

### Association

- has_many :items
- has_many :products


## items テーブル
| Column             | Type       | Options                        |
| ---------------    | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| explain            | text       | null: false                    |
| category_id        | references | null: false, foreign_key: true |
| item_condition     | integer    | null: false                    |
| delivery-fee       | integer    | null: false                    |
| shipping_origin    | integer    | null: false                    |
| day_until_shipping | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :products

## product テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| buyer    | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :items