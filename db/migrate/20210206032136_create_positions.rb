class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :name, null: false
      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
