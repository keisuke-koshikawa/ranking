class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :ancestry
      t.integer :ancestry_depth
      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
