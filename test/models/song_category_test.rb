# == Schema Information
#
# Table name: song_categories
#
#  id          :integer          not null, primary key
#  song_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_song_categories_on_category_id  (category_id)
#  index_song_categories_on_song_id      (song_id)
#

require 'test_helper'

class SongCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
