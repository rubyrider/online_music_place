class CreateSongLanguages < ActiveRecord::Migration
  def change
    create_table :song_languages do |t|
      t.references :song, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
