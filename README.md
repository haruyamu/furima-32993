## items テーブル

| column            | type        | options                      |
| ----------------- | ----------- | ---------------------------- |
| name              | string      | null:false                   |
| explain           | text        | null:false                   |
| category          | string      | null:false                   |
| state             | text        | null:false                   |
| shipping_fee      | integer     | null:false                   |
| prefecture        | string      | null:false                   |
| schedule_delivery | date        | null:false                   |
| price             | integer     | null:false                   |
| tax_price         | integer     | null:false                   |
| user              | preferences | null:false, foreign_key:true |

### Association

- belongs_to :user
- has_one :order

## users テーブル

| column   | type   | options    |
| -------- | ------ | ---------- |
| name     | string | null:false |
| email    | string | null:false |
| password | string | null:false |

### Association

- has_many :items
- has_many :orders

## orders テーブル

| column | type        | options                      |
| ------ | ----------- | ---------------------------- |
| card   | string      | null:false                   |
| exp    | date        | null:false                   |
| cvc    | integer     | null:false                   |
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
| prefecture  | string      | null:false                   |
| city        | string      | null:false                   |
| address     | string      | null:false                   |
| bill        | string      | null:false                   |
| phone       | integer     | null:false                   |
| order       | preferences | null:false, foreign_key:true |

### Association

- belongs_to :order
