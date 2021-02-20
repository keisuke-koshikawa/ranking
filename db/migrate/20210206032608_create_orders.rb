class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :customer_name, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.date :ordered_at, null: false
      t.references :employee, null: false, foreign_key: true, index: true
      t.references :company, null: false, foreign_key: true, index: true
      t.references :department, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
