# == Schema Information
#
# Table name: song_artists
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_song_artists_on_artist_id  (artist_id)
#  index_song_artists_on_song_id    (song_id)
#

require 'test_helper'

class SongArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
