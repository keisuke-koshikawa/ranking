# Migration問題(初級)

## Q1. 以下のカラムを持つpostsテーブルを生成するマイグレーションファイルをターミナルから作成してください。

|name|type|option|description|
|id|bigint||プライマリーキー(主キー)|
|title|string|null: false, index: true|タイトル|
|body|text|null: false|本文|
|status|integer|null: false, default: 0|公開ステータス。下書き・公開済み・アーカイブの3種類のステータスを想定|
|created_at|datetime|null: false|作成日時|
|updated_at|datetime|null: false|更新日時|

答えはコマンドラインに打ち込んだ文字とマイグレーションファイルをご提出ください。

### 意図

- マイグレーションファイルを作成できるか？

## Q2. 先ほど作成したpostsテーブルをマイグレーションファイルやmodels/post.rbをまとめてコマンドラインから削除してください。

### 意図

- コマンドラインからマイグレーションファイルを削除する方法を知っているか？

## Q3. postsテーブルにemployee_idを外部キーとして追加するマイグレーションファイルを作成してください。

|name|type|option|description|
|id|bigint||プライマリーキー(主キー)|
|title|string|null: false, index: true|タイトル|
|body|text|null: false|本文|
|status|integer|null: false, default: 0|公開ステータス。下書き・公開済み・アーカイブの3種類のステータスを想定|
|created_at|datetime|null: false|作成日時|
|updated_at|datetime|null: false|更新日時|
|(追加)employee_id|bigint|foreign_key: true, index: true, null: false|外部キー|

### 意図

- 外部キーを追加する際のマイグレーションを理解しているか？

## Q4. employeesテーブルに身長・体重を小数点1桁まで保存できるカラムを追加するマイグレーションファイルを作成してください。

### 意図

- 小数を保存するカラムを作成できるか？

## Q5. string型とtext型はどういう時に使い分けるべきか回答してください。

### 意図

- string型とtext型の違いとユースケースを理解しているか？