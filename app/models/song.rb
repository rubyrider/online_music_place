# == Schema Information
#
# Table name: songs
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  album_id      :string(255)
#  filename      :string(255)
#  asset         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  track_id      :integer
#  demo_track_id :integer
#

class Song < ActiveRecord::Base

  searchkick

  belongs_to :album
  has_many :song_languages
  has_many :languages, through: :song_languages
  has_many :song_artists
  has_many :artists, through: :song_artists
  has_many :song_categories
  has_many :categories, through: :song_categories
  has_many :liked_songs
  has_many :users, through: :liked_songs
  belongs_to :track
  belongs_to :demo_track, class_name: 'Track', foreign_key: :demo_track_id
  has_many :play_list_songs
  has_many :play_lists, through: :play_list_songs

  accepts_nested_attributes_for :track
  accepts_nested_attributes_for :demo_track

  before_validation :assign_default_album

  def self.filter_by_params(params)
    results = Song.all
    if params[:name].present?
      results = results.where('name LIKE ?', "%#{params[:name]}%")
    end
    if params[:album].present?
      results = results.joins(:album).where('albums.name LIKE ?', "%#{params[:album]}%")
    end
    if params[:file_name].present?
      results = results.where('filename LIKE ?', params[:file_name])
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

  # assign default album if no album provided
  # it creates anonymous album if no album provided
  #
  # @assign album_id
  def assign_default_album
    return true if self.album_id.present? && Album.exists?(id: self.album_id)

    @album                =  Album.new
    @album.name           =  @album.default_title
    @album.release_date   =  Date.today
    @album.anonymous      =  true
    @album.save!

    self.album_id         =  @album.id
  end

end
