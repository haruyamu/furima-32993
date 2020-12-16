## items テーブル

| column               | type       | options                      |
| -------------------- | ---------- | ---------------------------- |
| name                 | string     | null:false                   |
| explain              | text       | null:false                   |
| category_id          | integer    | null:false                   |
| state_id             | integer    | null:false                   |
| shipping_fee_id      | integer    | null:false                   |
| prefecture_id        | integer    | null:false                   |
| schedule_delivery_id | integer    | null:false                   |
| price                | integer    | null:false                   |
| user                 | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- has_one :order

## users テーブル

| column             | type   | options    |
| ------------------ | ------ | ---------- |
| nickname           | string | null:false |
| last_name          | string | null:false |
| first_name         | string | null:false |
| last_name_kana     | string | null:false |
| first_name_kana    | string | null:false |
| email              | string | null:false |
| encrypted_password | string | null:false |
| birthday           | date   | null:false |

### Association

- has_many :items
- has_many :orders

## orders テーブル

| column | type       | options                      |
| ------ | ---------- | ---------------------------- |
| user   | references | null:false, foreign_key:true |
| item   | references | null:false, foreign_key:true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| column        | type       | options                      |
| ------------- | ---------- | ---------------------------- |
| postal_code   | string     | null:false                   |
| prefecture_id | integer    | null:false                   |
| city          | string     | null:false                   |
| address       | string     | null:false                   |
| bill          | string     |                              |
| phone         | string     | null:false                   |
| order         | references | null:false, foreign_key:true |

### Association

- belongs_to :order
