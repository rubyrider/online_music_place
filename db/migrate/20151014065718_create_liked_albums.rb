class CreateLikedAlbums < ActiveRecord::Migration
  def change
    create_table :liked_albums do |t|
      t.integer :user_id
      t.integer :album_id

      t.timestamps null: false
    end
  end
end