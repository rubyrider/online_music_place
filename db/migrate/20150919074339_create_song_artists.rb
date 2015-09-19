class CreateSongArtists < ActiveRecord::Migration
  def change
    create_table :song_artists do |t|
      t.references :song, index: true, foreign_key: true
      t.references :artist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
