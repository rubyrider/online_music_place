class CreatePortalConfigurations < ActiveRecord::Migration
  def change
    create_table :portal_configurations do |t|
      t.string :meta_title
      t.text :meta_description
      t.text :meta_keywords
      t.string :site_title
      t.string :facebook_api_key
      t.string :facebook_api_secret
      t.string :facebook_profile
      t.string :linkedin_profile
      t.string :twitter_profile
      t.string :google_profile
      t.string :version
      t.string :hotline
      t.string :contact_email
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :country
      t.string :province
      t.string :zip
      t.string :logo
      t.text :about

      t.timestamps null: false
    end
  end
end
