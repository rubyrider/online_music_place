class Category < ActiveRecord::Base
  has_many :song_categories
  has_many :songs, through: :song_categories
  has_many :album_categories
  has_many :albums, through: :album_categories
end
