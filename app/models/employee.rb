class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :department
  belongs_to :position
  has_many :orders

  enum sex: { male: false, female: true }

  scope :listed_employees, -> () {
    query = <<-SQL
      SELECT id, retired_at,
      CASE
        WHEN retired_at IS NULL THEN last_name || first_name
        ELSE last_name || first_name || '(退職済み)'
      END as name
      FROM employees
      ORDER BY id ASC
    SQL

    find_by_sql(query)
  }

  scope :added_retired_flag_employees, -> () {
    query = <<-SQL
      SELECT id, retired_at,
      CASE
        WHEN retired_at IS NULL THEN 0
        ELSE 1
      END as retire_flag
      FROM employees
      ORDER BY id ASC
    SQL

    find_by_sql(query)
  }

  scope :length_of_service, -> () {
    query = <<-SQL
      SELECT id, last_name, first_name,
      (COALESCE(retired_at, current_date) - hired_at) / 365 as length_of_service
      FROM employees
      ORDER BY id ASC
    SQL

    find_by_sql(query)
  }
end
