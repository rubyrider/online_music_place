class AddAnonymousToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :anonymous, :boolean, default: false
  end
end
