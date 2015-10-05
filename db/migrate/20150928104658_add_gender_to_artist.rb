class AddGenderToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :gender, :integer
  end
end
