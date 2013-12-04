class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :tip_id
      t.integer :to_do_list_id
    end
  end
end
