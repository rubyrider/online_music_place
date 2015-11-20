class AddNewReleaseToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :new_release, :boolean
  end
end
