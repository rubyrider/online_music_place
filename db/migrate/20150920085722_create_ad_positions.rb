class CreateAdPositions < ActiveRecord::Migration
  def change
    create_table :ad_positions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
