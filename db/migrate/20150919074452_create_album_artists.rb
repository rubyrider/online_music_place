class CreateAlbumArtists < ActiveRecord::Migration
  def change
    create_table :album_artists do |t|
      t.references :album, index: true, foreign_key: true
      t.references :artist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
