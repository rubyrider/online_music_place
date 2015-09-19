class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slogan
      t.text :details
      t.date :since

      t.timestamps null: false
    end
  end
end
