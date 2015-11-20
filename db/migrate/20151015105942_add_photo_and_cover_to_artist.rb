class AddPhotoAndCoverToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :cover, :string
    add_column :artists, :photo, :string
  end
end
