Portforio name: FURIMA

誰でも売りたい商品を投稿し自分の出し値をつける。その投稿した商品を観覧者が購入できる、アプリケーション。

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
| Column                | Type       | Options                        |
| ---------------       | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| explain               | text       | null: false                    |
| category_id           | integer    | null: false                    |
| item_condition_id     | integer    | null: false                    |
| delivery_feed_id      | integer    | null: false                    |
| shipping_origin_id    | integer    | null: false                    |
| day_until_shipping_id | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## address テーブル

| Column        | Type        | Options                        |
| -------       | ----------  | ------------------------------ |
| post_code     | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| city          | string      | null: false                    |
| house_number  | string      | null: false                    |
| building_name | string      |                                |
| phone_number  | string      | null: false                    |
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
- has_one :address




