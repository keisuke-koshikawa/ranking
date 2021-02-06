class Order < ApplicationRecord
  belongs_to :employee
  belongs_to :company

  enum status: [:un_official, :fixed]

  # 社員ごとの累計の売り上げTOP10をランキング付きで出力する
  scope :get_total_earning_group_by_employee_top_ten, -> () {
    sub_query = <<-SQL
      SELECT orders.employee_id, SUM(orders.price) as total_earning
      FROM orders
      GROUP BY employee_id
    SQL

    sql =  <<-SQL
      SELECT employee_id, total_earning, RANK () OVER (ORDER BY total_earning DESC) as ranking
      FROM (#{sub_query}) as total_earnings
      LIMIT 10
    SQL

    ActiveRecord::Base.connection.select_all(sql).to_hash
  }
end
