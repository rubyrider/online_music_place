# == Schema Information
#
# Table name: liked_artists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LikedArtist < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
end
