class AddRightPositionAndLeftPositionToAdvertisement < ActiveRecord::Migration
  def change
    add_column :advertisements, :right_position, :boolean
    add_column :advertisements, :left_position, :boolean
  end
end
