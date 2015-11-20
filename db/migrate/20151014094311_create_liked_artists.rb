class CreateLikedArtists < ActiveRecord::Migration
  def change
    create_table :liked_artists do |t|
      t.integer :user_id
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
