class AddLeftSideToPlayList < ActiveRecord::Migration
  def change
    add_column :play_lists, :left_side, :boolean
  end
end
