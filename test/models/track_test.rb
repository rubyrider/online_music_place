# == Schema Information
#
# Table name: tracks
#
#  id                 :integer          not null, primary key
#  song_id            :integer
#  name               :string(255)
#  duration           :string(255)
#  demo_song_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  attachment         :string(255)
#  audio_file_name    :string(255)
#  audio_content_type :string(255)
#  audio_file_size    :integer
#  audio_updated_at   :datetime
#
# Indexes
#
#  index_tracks_on_demo_song_id  (demo_song_id)
#  index_tracks_on_song_id       (song_id)
#

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
