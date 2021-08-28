class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, index: true, comment: "タイトル"
      t.text :body, null: false, comment: "本文"
      t.integer :status, null: false, default: 0, comment: "公開ステータス。下書き・公開済み・アーカイブの3種類の内容を想定"
      t.datetime :created_at, null: false, comment: "作成日時"
      t.datetime :updated_at, null: false, comment: "更新日時"

      t.timestamps
    end
  end
end