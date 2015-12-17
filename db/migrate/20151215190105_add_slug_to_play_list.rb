class AddSlugToPlayList < ActiveRecord::Migration
  def change
    add_column :play_lists, :slug, :string
    add_index :play_lists, :slug, unique: true
  end
end
