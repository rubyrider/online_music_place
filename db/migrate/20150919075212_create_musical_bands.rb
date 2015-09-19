class CreateMusicalBands < ActiveRecord::Migration
  def change
    create_table :musical_bands do |t|
      t.string :name
      t.string :details
      t.date :date_of_birth
      t.boolean :active

      t.timestamps null: false
    end
  end
end
