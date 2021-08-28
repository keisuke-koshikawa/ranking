class AddHeightWeightToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :height, :decimal, scale: 1, comment: "身長"
    add_column :employees, :weight, :decimal, scale: 1, comment: "体重"
  end
end
