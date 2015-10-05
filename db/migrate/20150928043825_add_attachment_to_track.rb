class AddAttachmentToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :attachment, :string
  end
end
