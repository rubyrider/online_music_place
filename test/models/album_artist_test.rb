# == Schema Information
#
# Table name: album_artists
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_album_artists_on_album_id   (album_id)
#  index_album_artists_on_artist_id  (artist_id)
#

require 'test_helper'

class AlbumArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
