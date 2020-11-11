# テーブル設計

## users テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| nickname           | string    | null: false |
| email              | string    | null: false |
| encrypted_password | string    | null: false |
| first_name         | string    | null: false |
| last_name          | string    | null: false |
| first_name_kana    | string    | null: false |
| last_name_kana     | string    | null: false |
| birthday           | date      | null: false |

### Association

- has_many :items
- has_many :purchase


## items テーブル
| Column             | Type       | Options                        |
| ---------------    | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| explain            | text       | null: false                    |
| category           | references | null: false, foreign_key: true |
| item_condition_id  | integer    | null: false                    |
| delivery-feed_id   | integer    | null: false                    |
| shipping_origin    | integer    | null: false                    |
| day_until_shipping | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## address テーブル

| Column        | Type        | Options                        |
| -------       | ----------  | ------------------------------ |
| address_id    | integer     | null: false                    |
| post_code_id  | integer     | null: false                    |
| preficture_id | integer     | null: false                    |
| city          | string      | null: false                    |
| building_name | string      |                                |
| phone_number  | string      |                                |
| purchase      | references  | null: false, foreign_key: true |



### Association

- belongs_to :purchase


## purchase テーブル

 Column         |  Type      | Options                        |
| -------       | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase




