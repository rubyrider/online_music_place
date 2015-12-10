class AddCoverToPlayList < ActiveRecord::Migration
  def change
    add_column :play_lists, :cover, :string
  end
end
