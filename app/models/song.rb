require 'taglib'
require 'audioinfo'
require 'pty'
require 'expect'

class Song < ActiveRecord::Base

  AUDIO_FORMATS = [:m4a, :ogg]

  include SlugConcern

  searchkick

  mount_uploader :audio, SongAudioUploader
  mount_uploader :picture, AlbumCoverUploader
  attr_reader :properties

  belongs_to :album
  has_many :song_languages, dependent: :delete_all
  has_many :languages, through: :song_languages
  has_many :song_artists, dependent: :delete_all
  has_many :artists, through: :song_artists
  has_many :song_categories, dependent: :delete_all
  has_many :categories, through: :song_categories
  has_many :liked_songs, dependent: :delete_all
  has_many :users, through: :liked_songs
  belongs_to :track
  belongs_to :demo_track, class_name: 'Track', foreign_key: :demo_track_id
  has_many :play_list_songs, dependent: :delete_all
  has_many :play_lists, through: :play_list_songs

  accepts_nested_attributes_for :track
  accepts_nested_attributes_for :demo_track

  before_validation :assign_default_album
  before_validation :set_song_title!

  validates_presence_of :audio

  after_save :update_duration
  before_save :find_or_create_artist
  after_save :generate_audio_versions

  def as_json(options = nil)
    {
        id:         self.id,
        slug:       self.slug,
        name:       self.name,
        album_id:   self.album_id,
        # album:      self.album,
        created_at: self.created_at,
        updated_at: self.updated_at,
        song_url:   self.audio_url,
        # song_url:   'http://107.161.122.164:8000/songs/3/Track_1.mp3',
        duration:   self.duration,
        picture:    self.picture.as_json[:picture],
        favorite:   false,
        playlist:   false
    }
  end

  def song_with_user_preference(current_user = nil)
    self.as_json.merge({
                           favorite: self.favorite_by?(current_user),
                           playlist: self.belongs_to_playlist?(current_user)

                       })

  end

  def audio_url
    Signature.new(self).generate_uri
  end

  def favorite_by?(user = nil)
    return false if user.nil?

    self.users.include?(user)
  end

  def belongs_to_playlist?(user = nil)
    return false if user.nil?

    user.play_list_songs.include?(self)
  end

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

  def song_cover_image(style = :sm)
    # if (image_object = self.picture.url(style).presence)
    #   image_object
    # else
    #   self.info.info.tag2.fetch('APIC') rescue default_cover_image
    # end
  end

  def default_cover_image
    nil
  end

  private

  def set_song_title!
    unless self.name.present?
      if tag_title.present?
        self.name = "#{tag_title}-#{self.id}"
      else
        self.name = "Track-#{self.id}"
      end
    end
  end

  # assign default album if no album provided
  # it creates anonymous album if no album provided
  #
  # @assign album_id
  def assign_default_album
    if self.album_id.present?
      return true
    end
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
    return true if duration.present?

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

      self.artists << @artist if !self.artists.exists?(id: @artist.id) && @artist.present?
    end
  end

  def collect_formats

  end

  private

  def generate_audio_versions
    AUDIO_FORMATS.each do |format|
      convert_to_given_format format
    end
  end

  def convert_to_given_format(format = 'm4a', forced = false)
    puts "encoding to #{format}"

    # if format_already_exists(format) && !forced
    #   return true # silently avoid, force command is there to avoid this steps!
    # end

    orig_file_name         = self.read_attribute(:audio)
    orig_file_with_new_ext = "#{ENV['SLOCATION']}/#{self.id}/#{orig_file_name.gsub(/\.mp3/, ".#{format}")}"

    puts orig_file_with_new_ext

    PTY.spawn("ffmpeg -i #{self.audio.path} -vn #{orig_file_with_new_ext}") do |reader, writer, p|
      begin
        if reader.expect(/Overwrite/, 10).present? # cont. in 5s if input doesn't match
          puts "Current format already exists"
          writer.puts('y')
        end
      rescue Errno::EIO
      ensure
        Process.wait p
      end
    end

    format_already_exists(format)
  end

  public

  def format_already_exists(format)
    File.exist? self.audio.path.gsub(/\.mp3/, ".#{format}")
  end

end
