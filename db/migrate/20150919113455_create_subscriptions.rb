class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.text :details
      t.date :start_date
      t.date :end_date
      t.boolean :active

      t.timestamps null: false
    end
  end
end
