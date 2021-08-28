class AddEmployeeRefToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :employees, null: false, foreign_key: true, index: true
  end
end
