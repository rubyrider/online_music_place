# == Schema Information
#
# Table name: musical_bands
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  details       :string(255)
#  date_of_birth :date
#  active        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class MusicalBandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
