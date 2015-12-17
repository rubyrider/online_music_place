class CreateDefaultPortalConfigurationValue < ActiveRecord::Migration
  def up
    PortalConfiguration.create!
  end

  def down
    PortalConfiguration.destroy_all
  end
end
