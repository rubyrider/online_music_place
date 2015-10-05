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

class SongArtist < ActiveRecord::Base
  belongs_to :song
  belongs_to :artist
end
