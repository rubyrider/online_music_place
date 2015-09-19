class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :album_id
      t.string :filename
      t.string :asset

      t.timestamps null: false
    end
  end
end
