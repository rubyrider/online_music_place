# == Schema Information
#
# Table name: liked_albums
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LikedAlbum < ActiveRecord::Base
  belongs_to :user
  belongs_to :album
end
