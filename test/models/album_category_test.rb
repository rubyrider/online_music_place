# == Schema Information
#
# Table name: album_categories
#
#  id          :integer          not null, primary key
#  album_id    :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_album_categories_on_album_id     (album_id)
#  index_album_categories_on_category_id  (category_id)
#

require 'test_helper'

class AlbumCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
