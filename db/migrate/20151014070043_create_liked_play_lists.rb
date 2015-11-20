class CreateLikedPlayLists < ActiveRecord::Migration
  def change
    create_table :liked_play_lists do |t|
      t.integer :user_id
      t.integer :play_list_id

      t.timestamps null: false
    end
  end
end
