class AddPopularityToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :popularity, :float, default: 10
  end
end
