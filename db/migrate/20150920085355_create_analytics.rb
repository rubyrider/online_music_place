class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.string :name
      t.string :content_type
      t.string :metric_name
      t.string :count
      t.integer :content_id

      t.timestamps null: false
    end
    add_index :analytics, :content_id
  end
end
