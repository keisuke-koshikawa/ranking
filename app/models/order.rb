class Order < ApplicationRecord
  belongs_to :company
  belongs_to :employee
  belongs_to :department

  enum status: [:un_official, :fixed]

  # 社員ごとの累計の売り上げTOP10をランキング付きで出力する
  scope :get_total_earning_group_by_employee_top_ten, -> () {
    sub_query = <<-SQL.squish
      SELECT orders.employee_id, SUM(orders.price) as total_earning
      FROM orders
      GROUP BY employee_id
    SQL

    query =  <<-SQL
      SELECT employee_id, total_earning, RANK () OVER (ORDER BY total_earning DESC) as ranking
      FROM (#{sub_query}) as total_earnings
      LIMIT 10
    SQL

    find_by_sql(query)
  }

  scope :position_separated_order, -> () {
    query = <<-SQL.squish
      SELECT sort, price, *
      FROM (
        SELECT order_1.*,
        CASE
          WHEN pos.name = '支店長' then 0
          WHEN pos.name = '課長' then 2
          WHEN pos.name = '係長' then 4
          WHEN pos.name = '一般社員' then 6
        end AS sort
        FROM orders as order_1
        INNER JOIN employees AS emp ON emp.id = order_1.employee_id
        INNER JOIN positions AS pos ON pos.id = emp.position_id
        WHERE emp.sex = '0'
        UNION
        SELECT order_2.*,
        CASE
          WHEN pos.name = '支店長' then 1
          WHEN pos.name = '課長' then 3
          WHEN pos.name = '係長' then 5
          WHEN pos.name = '一般社員' then 7
        end AS sort
        FROM orders as order_2
        INNER JOIN employees AS emp ON emp.id = order_2.employee_id
        INNER JOIN positions AS pos ON pos.id = emp.position_id
        WHERE emp.sex = '1'
      ) AS sorted_orders
      ORDER BY sort, price DESC
    SQL

    find_by_sql(query)
  }
end