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
#  cover        :string(255)
#  new_release  :boolean
#

class Album < ActiveRecord::Base

  searchkick
  
  DEFAULT_TITLE = 'Untitled Album'.freeze

  include Anonymity
  mount_uploader :cover, AlbumCoverUploader

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

  def self.filter_by_params(params)
    results = Album.all
    if params[:name].present?
      results = results.where('name LIKE ?', "%#{params[:name]}%")
    end
    if params[:year].present?
      results = results.where(release_date: Date.parse("01-01-#{params[:year]}")..Date.parse("31-12-#{params[:year]}"))
    end
    if params[:artist].present?
      results = results.joins(:artists).where('artists.name LIKE ?', "%#{params[:artist]}%")
    end
    if params[:category].present?
      results = results.joins(:categories).where('categories.name LIKE ?', "%#{params[:category]}%")
    end

    results
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
