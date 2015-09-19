class Album < ActiveRecord::Base

  has_many :songs
  has_many :album_artists
  has_many :artists, through: :album_artists
  has_many :album_categories
  has_many :categories, through: :album_categories
end
