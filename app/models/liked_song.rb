# == Schema Information
#
# Table name: liked_songs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  song_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LikedSong < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
end
