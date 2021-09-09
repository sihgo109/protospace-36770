# README
# テーブル設計

## users_table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

### Association

- has_many :prototype_users
- has_many :prototypes, through: :prototype_users
- has_many :comments



## prototype_table

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| title              | string       | null: false |
| catch_copy         | text         | null: false |
| concept            | text         | null: false |
| image              | ActiveStrage | null: false |
| user               | text         | null: false |

### Association

- has_many :prototype_users
- has_many :users, through: :prototype_users
- has_many :comments



## comments table

| Column    | Type       | Options     |
| --------- | ---------- | ------------|
| text      | text       | null: false |
| user      | references | null: false |
| prototype | references | null: false |

### Association

- belongs_to :prototype
- belongs_to :user
