class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :song, index: true, foreign_key: true
      t.string :name
      t.string :duration
      t.integer :demo_song_id

      t.timestamps null: false
    end
    add_index :tracks, :demo_song_id
  end
end
