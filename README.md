## users テーブル

|Column                   |Type   |Options                  |
|-------------------------|-------|-------------------------|
|nickname                 |string |null: false              |
|email                    |string |null: false, unique: true|
|encrypted_password       |string |null: false              |
|last_name                |string |null: false              |
|first_name               |string |null: false              |
|last_name_kana           |string |null: false              |
|first_name_kana          |string |null: false              |
|birthday                 |date   |null: false              |


### Association
- has_many :items
- has_many :purchase_records

## items テーブル

|Column             |Type   |Options    |
|-------------------|-------|-----------|
|title              |string |null: false|
|explanation        |text   |null: false|
|category_id        |integer|null: false|
|status_id          |integer|null: false|
|shipping_charge_id |integer|null: false|
|shipment_source_id |integer|null: false|
|days_id            |integer|null: false|
|price              |integer|null: false|


### Association
- has_one    :purchase_record
- belongs_to :user

## street_address テーブル

|Column         |Type   |Options          |
|---------------|-------|-----------------|
|postal_code    |string |null: false      |
|prefectures_id |integer|null: false      |
|municipality   |string |null: false      |
|address        |string |null: false      |
|building_name  |string |                 |
|phone_number   |string |null: false      |
|purchase_record|integer|foreign_key: true|


### Association
- belongs_to :purchase_record


## purchase_record テーブル

|Column |Type      |Options|
|-------|----------|-------|
|user   |references|       |
|item   |references|       |


### Association
- belongs_to :user
- belongs_to :item
- has_one :street_address