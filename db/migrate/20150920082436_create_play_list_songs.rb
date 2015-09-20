class CreatePlayListSongs < ActiveRecord::Migration
  def change
    create_table :play_list_songs do |t|
      t.references :play_list, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
