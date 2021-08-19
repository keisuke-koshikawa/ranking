# ActiveRecord　Query 問題 【中級】

[schema定義](https://github.com/keisuke-koshikawa/ranking/blob/master/db/schema.rb)を参考に、以下の問題に回答してください。

## Q1. 以下のQueryをN + 1が発生しないように修正してください。

```
@employee = Employee.all

@employee.each do |employee|
  employee.company.name
end
```

### 意図

- N + 1の解決手段を知っているか？
- 上記でなぜN + 1 が発生するか理解できているか？

## Q2. ordersテーブルのpriceが5000000かつstatusがfixedのレコードを取得するActiveRecord Queryを書いてください。

### 意図

- 絞り込みのQuery Methodに複数の条件を指定できることを理解しているか？

## Q3. ordersテーブルのpriceが1000000から3000000のレコードを取得するActiveRecord Queryを書いてください。

### 意図

- 範囲検索ができるかどうか？

## Q4. employeesテーブルの中で、sexがmaleでないレコードを取得するActiveRecord Queryを書いてください。


### 意図

- 否定のQuery Methodsを理解しているか？

## Q5. employeesテーブルのレコードの全てのhired_atの中身を集めて配列にしてください。

### 意図

- 値を集めて配列として返すメソッドを知っているか？