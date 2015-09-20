class CreatePlayLists < ActiveRecord::Migration
  def change
    create_table :play_lists do |t|
      t.string :name
      t.integer :user_id
      t.boolean :system_play_list
      t.string :aasm_state
      t.integer :share_count
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
