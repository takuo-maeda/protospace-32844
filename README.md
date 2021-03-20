# README

#テーブル設計

##usersテーブル

| colomn      | Type         | Options      |
| ----------- | ------------ | ------------ |
| email       | string       | null: false  |
| password    | string       | null: false  |
| name        | string       | null: false  |
| profile     | text         | null: false  |
| occupation  | text         | null: false  |
| posion      | text         | null: false  |

#Association

- has_many :title
- has_many :catch_copy
- has_many :concept
- has_many :image


##prototypesテーブル
| colomn      | Type         | Options              |
| ----------- | ------------ | -------------------- |
| title       | string       | null: false          |
| catch_copy  | text         | null: false          |
| concept     | text         | null: false          |
| image       |              | ActiveStorageで実装  |
| user        | references   | null: false          |

#Association
- belongs_to :user


##commentsテーブル
| colomn      | Type         | Options              |
| ----------- | ------------ | -------------------- |
| text        | text         | null: false          |
| user        | references   | null: false          |
| prototype   | references   | null: false          |

- belongs_to : user
- belongs_to : prototypes