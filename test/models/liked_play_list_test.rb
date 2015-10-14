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

require 'test_helper'

class LikedPlayListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
