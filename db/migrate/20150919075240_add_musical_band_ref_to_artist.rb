class AddMusicalBandRefToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :musical_band_id, :integer
    add_index :artists, :musical_band_id
  end
end
