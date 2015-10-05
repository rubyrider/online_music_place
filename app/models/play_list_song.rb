# == Schema Information
#
# Table name: play_list_songs
#
#  id           :integer          not null, primary key
#  play_list_id :integer
#  song_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_play_list_songs_on_play_list_id  (play_list_id)
#  index_play_list_songs_on_song_id       (song_id)
#

class PlayListSong < ActiveRecord::Base
  belongs_to :play_list
  belongs_to :song
end
