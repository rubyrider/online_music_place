# == Schema Information
#
# Table name: liked_play_lists
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  play_list_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LikedPlayList < ActiveRecord::Base
  belongs_to :user
  belongs_to :play_list
end
