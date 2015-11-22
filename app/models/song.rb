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
#  artist_name   :string(255)
#  audio         :string(255)
#  duration      :float(24)
#

require 'taglib'
require 'audioinfo'

class Song < ActiveRecord::Base

  # searchkick

  mount_uploader :audio, SongAudioUploader
  attr_reader :properties

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
  before_validation :set_song_title!

  after_save :update_duration
  before_save :find_or_create_artist

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

  def tags
    properties = initiate_properties

    @properties = {
        name:        properties.try(:title),
        artist_name: properties.try(:artist),
    }
  end

  alias_method :tags?, :tags

  def info
    initiate_properties
  end

  def raw_length
    self.info.length.to_f rescue 0.0
  end

  def tag_album
    __album_name = initiate_properties.try(:album)
  end

  def tag_title
    __song_title = initiate_properties.try(:title)
  end

  private
  def set_song_title!
    if self.name.blank?
      __song_title = initiate_properties.try(:album)
      self.name    = __song_title
    end
  end

  # assign default album if no album provided
  # it creates anonymous album if no album provided
  #
  # @assign album_id
  def assign_default_album
    if tag_album.present?
      @album = Album.where(name: tag_album).first_or_create!

      self.album_id = @album.id
    end
  end

  def initiate_properties(field = :audio)
    song_path = self.send(field).path
    puts '[Tag Generator]'
    puts '[Tag Generator]: Generating song tag information'

    AudioInfo.open(song_path) { |info| info } rescue nil
  end

  def update_duration
    __length = (raw_length / 60.00).round(2)
    update_column(:duration, __length)
  end

  # assign default album if no album provided
  # it creates anonymous album if no album provided
  #
  # @assign album_id
  def find_or_create_artist
    # check for albums
    __artist_name = initiate_properties.try(:artist)

    if __artist_name.present?
      @artist = Artist.where(name: __artist_name).first_or_create!

      self.artists << @artist if @artist.present?
    end
  end

end
