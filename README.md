## items テーブル

| column               | type        | options                      |
| -------------------- | ----------- | ---------------------------- |
| name                 | string      | null:false                   |
| explain              | text        | null:false                   |
| category_id          | integer     | null:false                   |
| state_id             | integer     | null:false                   |
| shipping_fee_id      | integer     | null:false                   |
| prefecture_id        | integer     | null:false                   |
| schedule_delivery_id | integer     | null:false                   |
| price                | integer     | null:false                   |
| user                 | preferences | null:false, foreign_key:true |

### Association

- belongs_to :user
- has_one :order

## users テーブル

| column             | type   | options    |
| ------------------ | ------ | ---------- |
| last_name          | string | null:false |
| first_name         | string | null:false |
| last_name_kana     | string | null:false |
| first_name_kana    | string | null:false |
| email              | string | null:false |
| encrypted_password | string | null:false |

### Association

- has_many :items
- has_many :orders

## orders テーブル

| column | type        | options                      |
| ------ | ----------- | ---------------------------- |
| user   | preferences | null:false, foreign_key:true |
| item   | preferences | null:false, foreign_key:true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| column      | type        | options                      |
| ----------- | ----------- | ---------------------------- |
| postal_code | string      | null:false                   |
| city        | string      | null:false                   |
| address     | string      | null:false                   |
| bill        | string      |                              |
| phone       | integer     | null:false                   |
| order       | preferences | null:false, foreign_key:true |

### Association

- belongs_to :order
