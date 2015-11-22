# == Schema Information
#
# Table name: songs
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  album_id      :string(255)
#  filename      :string(255)
#  asset         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  track_id      :integer
#  demo_track_id :integer
#  artist_name   :string(255)
#  audio         :string(255)
#  duration      :float(24)
#

require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
