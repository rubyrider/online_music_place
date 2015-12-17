class AddPictureToSong < ActiveRecord::Migration
  def change
    add_column :songs, :picture, :string
  end
end
