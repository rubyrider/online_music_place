# == Schema Information
#
# Table name: play_lists
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  user_id          :integer
#  system_play_list :boolean
#  aasm_state       :string(255)
#  share_count      :integer
#  featured         :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class PlayListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
