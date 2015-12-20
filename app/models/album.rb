class Album < ActiveRecord::Base
  include SlugConcern

  searchkick
  
  DEFAULT_TITLE = 'Untitled Album'.freeze

  include Anonymity
  mount_uploader :banner, BannerUploader
  mount_uploader :cover, AlbumCoverUploader

  has_many :songs, dependent: :nullify
  has_many :album_artists
  has_many :artists, through: :album_artists
  has_many :album_categories
  has_many :categories, through: :album_categories
  has_many :liked_albums
  has_many :users, through: :liked_albums

  before_validation :set_default_title

  def as_json(options = nil)
    {
        id:         self.to_param,
        name:       self.name,
        cover:      self.cover,
        banner:     self.banner,
        created_at: self.created_at,
        categories: self.categories,
        audios:     self.songs,
        favorite:   false
    }
  end

  def with_user_preference(current_user = nil)
    self.as_json.merge({
                           favorite: self.favorite_by?(current_user)

                       })

  end

  def default_title
    "#{DEFAULT_TITLE}-#{Date.today.strftime('%F')}"
  end

  def title
    name || default_title
  end

  def favorite_by?(user = nil)
  return false if user.nil?
    self.users.include?(user)
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
