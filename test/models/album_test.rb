# == Schema Information
#
# Table name: albums
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  release_date :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  anonymous    :boolean          default(FALSE)
#

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
