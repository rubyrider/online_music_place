# == Schema Information
#
# Table name: artists
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  age             :string(255)
#  dob             :string(255)
#  details         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  musical_band_id :integer
#  anonymous       :boolean
#  gender          :integer
#  cover           :string(255)
#  photo           :string(255)
#
# Indexes
#
#  index_artists_on_musical_band_id  (musical_band_id)
#

require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
