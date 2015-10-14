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

require 'test_helper'

class LikedSongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
