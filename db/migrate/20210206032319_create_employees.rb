class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :middle_name
      t.string :middle_name_kana
      t.boolean :sex, null: false
      t.date :hired_at, null: false
      t.date :retired_at
      t.references :company, null: false, foreign_key: true, index: true
      t.references :position, null: false, foreign_key: true, index: true
      t.references :department, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
