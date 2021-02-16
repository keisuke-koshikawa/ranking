|保存場所|実装難度|セキュリティ|備考|
| --- | --- | --- | --- |
|LocalStorage|低|XSS脆弱性があった場合にTokenを抜き出すのが容易||
|Cookie|中|HttpOnlyをTrueにすればJavaScriptでのCookie操作を無効化できるが、XSS脆弱性があった場合、XMLHttpRequestを実行されるとCookieを盗み出される|
|In-memory|高|攻撃者からすると、認証Tokenがどこに保存されているかわからないため、攻撃が困難|メモリにTokenを保存するためリロードすると再度認証が必要になり、UXが最悪|


# README

# Tables

## companies

|name|type|option|description|
| --- | --- | --- | --- |
|name|string|null: false|companyName|

## employees

|name|type|option|description|
| --- | --- | --- | --- |
|first_name|string|null: false|firstName|
|last_name|string|null: false|lastName|
|first_name_kana|string|null: false|firstNameKana(Katanaka)|
|last_name_kana|string|null: false|lastNameKana(Katanaka)|
|middle_name|string||middleName(Katanaka)|
|middle_name_kana|string||middleName(Katanaka)|
|hired_at|Date|null: false|join day|
|retired_at|Date||retired day|
|company_id|bigint|null: false, foreign_key: true, index: true|foreign_key|

## positions

|name|type|option|description|
| --- | --- | --- | --- |
|name|string|null: false|positionName|
|company_id|bigint|null: false, foreign_key: true, index: true|foreign_key|

## departments

|name|type|option|description|
| --- | --- | --- | --- |
|name|string|null: false|departmentName|
|ancestry|string||for ancestry|
|ancestry_depth|integer|default: 0|for depth caching using|
|company_id|bigint|null: false, foreign_key: true, index: true|foreign_key|

## orders

|name|type|option|description|
| --- | --- | --- | --- |
|customer_name|string|null: false|customerName|
|price|integer|null: false|price|
|status|integer|null: false|enum status: [:un_official, :fixed]|
|employee_id|bigint|null: false, foreign_key: true, index: true|foreign_key|
|company_id|bigint|null: false, foreign_key: true, index: true|foreign_key|
