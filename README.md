# README

# Table Design

## users

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototypes

| Column     | Type                | Options           |
| ---------- | ------------------- | ----------------- |
| title      | string              | null: false       |
| catch_copy | text                | null: false       |
| concept    | text                | null: false       |
| image      | ActiveStorage Table | null: false       |
| user       | references          | foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## comments

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

# System dependencies

# Ruby Ver

6.0.0

# Mysql Ver

0.5.3

# Configuration

database.yml:
utf8

application.rb:
config.generators do |g|
g.stylesheets false
g.javascripts false
g.helper false
g.test_framework false
end

# Database creation

# Database initialization

# How to run the test suite

# Services (job queues, cache servers, search engines, etc.)

# Deployment instructions

# ...
