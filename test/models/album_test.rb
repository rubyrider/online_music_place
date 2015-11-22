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
#  cover        :string(255)
#  new_release  :boolean
#  banner       :string(255)
#  popularity   :float(24)        default(10.0)
#

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
