class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :content
      t.date :from_date
      t.date :end_date
      t.boolean :featured
      t.string :ad_position_id
      t.float :height
      t.float :width
      t.boolean :modal
      t.text :custom_css

      t.timestamps null: false
    end
    add_index :advertisements, :ad_position_id
  end
end
