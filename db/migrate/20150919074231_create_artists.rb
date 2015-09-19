class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :age
      t.string :dob
      t.string :details

      t.timestamps null: false
    end
  end
end
