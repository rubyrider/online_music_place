class AddAnonymousToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :anonymous, :boolean
  end
end
