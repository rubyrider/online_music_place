# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :song_categories
  has_many :songs, through: :song_categories
  has_many :album_categories
  has_many :albums, through: :album_categories
end
