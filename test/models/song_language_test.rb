# == Schema Information
#
# Table name: song_languages
#
#  id          :integer          not null, primary key
#  song_id     :integer
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_song_languages_on_language_id  (language_id)
#  index_song_languages_on_song_id      (song_id)
#

require 'test_helper'

class SongLanguageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
