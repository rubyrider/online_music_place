class AddRefTrackAndRefDemoTrackToSong < ActiveRecord::Migration
  def up
    add_column :songs, :track_id, :integer, index: true
    add_column :songs, :demo_track_id, :integer, :index => true
  end

  def down
    remove_column :songs, :track_id
    remove_column :songs, :demo_track_id
  end
end
