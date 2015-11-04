class AddBannerToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :banner, :string
  end
end
