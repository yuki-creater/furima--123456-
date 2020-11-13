# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| id(PK)             | デフォルト          | null: false             |
| nickname           | devise のデフォルト | null: false,index: true |
| email              | devise のデフォルト | null: false             |
| encrypted_password | integer             | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_kana    | string              | null: false             |
| last_name_kana     | string              | null: false             |
| birth_date         | date                | null: false             |

### Association

* has_many :items
* has_many :item_transactions

## addresses table

| Column       | Type    | Options           |
|--------------|---------|-------------------|
| postal_code  | string | null: false       |
| prefecture   | integer | null: false       |
| city         | string  | null: false       |
| address      | string  | null: false       |
| building     | string  |                   |
| phone_number | string  | null: false       |
| item_transaction_id(FK)  | integer | foreign_key: true |

### Association

* belongs_to :item_transaction

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| id(PK)                              | デフォルト | null: false       |
| name                                | string     | null: false       |
| price                               | integer    | null: false       |
| info                                | text       | null: false       |
| scheduled_delivery_id(acitve_hash)  | integer    | null: false       |
| shipping_fee_status_id(acitve_hash) | integer    | null: false       |
| prefecture_id(acitve_hash)          | integer    | null: false       |
| sales_status_id(acitve_hash)        | integer    | null: false       |
| category_id(acitve_hash)            | integer    | null: false       |
| user_id(FK)                         | integer    | foreign_key: true |

### Association

- belongs_to :user
- has_one :item_transaction

## item_transactions table

| Column      | Type    | Options           |
|-------------|---------|-------------------|
| item_id(FK) | integer | foreign_key: true |
| user_id(FK) | integer | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## 備考

### 背景色が production で動作しない問題の対処

実際に起きて作業したので、作業ログとして記載させてください。

#### 準備

[1]`background-image: image-url('bg-main-visual-pict_pc.jpg');`のように`image-url`を使用する。

[2]`background-image: image-url('bg-main-visual-pict_pc.jpg');`などの`image-url`を使用しているファイルの拡張子を css から scss に変更。

### heroku の環境変数設定

参考：https://devcenter.heroku.com/articles/config-vars

**一覧表示**
`% heroku config`

**特定の変数を表示**
`% heroku config:get <変数名>`

**変数をセットする**
`% heroku config:set <変数名>=<値>`

**変数を削除する**
`% heroku config:unset <変数名>`

**Railsで使用するは変わらず下記で可能**
`ENV['<変数名>']`
