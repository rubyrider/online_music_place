class AddLogoAndBannerToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :logo, :string
    add_column :companies, :banner, :string
  end
end
