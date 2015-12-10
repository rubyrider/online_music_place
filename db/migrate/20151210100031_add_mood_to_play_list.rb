class AddMoodToPlayList < ActiveRecord::Migration
  def change
    add_column :play_lists, :mood, :boolean
  end
end
