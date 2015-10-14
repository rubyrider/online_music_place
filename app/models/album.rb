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
#

class Album < ActiveRecord::Base

  DEFAULT_TITLE = 'Untitled Album'.freeze

  include Anonymity

  has_many :songs
  has_many :album_artists
  has_many :artists, through: :album_artists
  has_many :album_categories
  has_many :categories, through: :album_categories
  has_many :liked_albums
  has_many :users, through: :liked_albums

  before_validation :set_default_title

  def default_title
    "#{DEFAULT_TITLE}-#{Date.today.strftime('%F')}"
  end

  private

  # set album title for untitled album
  #
  # @returns void
  def set_default_title
    return true if name.present?

    self.name = default_title
  end
end
