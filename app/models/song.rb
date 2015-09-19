class Song < ActiveRecord::Base

  belongs_to :album
  has_many :song_artists
  has_many :artists, through: :song_artists
  has_many :song_categories
  has_many :categories, through: :song_categories
  belongs_to :track
  belongs_to :demo_track, class_name: 'Track', foreign_key: :demo_song_id
end
