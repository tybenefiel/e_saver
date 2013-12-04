class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :room
      t.integer :price
      t.integer :saving
    end
  end
end
