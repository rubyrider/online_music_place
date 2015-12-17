class AddBandToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :band, :boolean
    add_column :artists, :band_leader, :boolean
    add_column :artists, :role, :string
    add_column :artists, :band_id, :integer
    add_index :artists, :band_id
  end
end
