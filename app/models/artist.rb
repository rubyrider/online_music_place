# == Schema Information
#
# Table name: artists
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  age             :string(255)
#  dob             :string(255)
#  details         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  musical_band_id :integer
#  anonymous       :boolean
#  gender          :integer
#  cover           :string(255)
#  photo           :string(255)
#
# Indexes
#
#  index_artists_on_musical_band_id  (musical_band_id)
#

class Artist < ActiveRecord::Base

  include SlugConcern
  include Anonymity

  searchkick

  mount_uploader :cover, ArtistCoverUploader
  mount_uploader :photo, ArtistPhotoUploader

  DEFAULT_NAME      = 'Anonymous Singer'.freeze
  MINIMUM_VALID_AGE = 4
  GENDER            = {
      :not_mentioned => 0,
      :male          => 1,
      :female        => 2,
      :other         => 3
  }

  has_many :song_artists
  has_many :songs, through: :song_artists
  has_many :album_artists
  has_many :albums
  has_many :liked_artists
  has_many :users, through: :liked_artists
  has_many :band_artists, class_name: 'Artist', foreign_key: :band_id
  belongs_to :musical_band

  def as_json(options = nil)
    {
        id:            self.to_param,
        likes:         self.users.count,
        who_likes:     self.users,
        name:          self.name,
        details:       self.details,
        gender:        self.gender,
        dob:           self.gender,
        band:          self.band,
        role:          self.role,
        bander_leader: self.band_leader,
        band_id:       self.band_id
    }
  end

  # t.boolean  "band"
  # t.boolean  "band_leader"
  # t.string   "role",            limit: 255
  # t.integer  "band_id",         limit: 4

  def default_name
    DEFAULT_NAME
  end

  # return gender name
  #
  # @returns male, female or specified
  def gender
    gender_value = read_attribute(:gender) || 0

    "#{ GENDER[gender_value].to_s }".humanize
  end

  def __age
    calculate_age
  end

  alias_method :age, :__age

  def self.filter_by_params(params)
    results = Artist.all
    if params[:name].present?
      results = results.where('name LIKE ?', "%#{params[:name]}%")
    end
    if params[:band].present?
      results = results.joins(:musical_band).where('musical_bands.name LIKE ?', "%#{params[:band_id]}%")
    end

    results
  end

  private

  # return true of false based on minimum valid age
  #
  # @returns [true|false]
  def validate_age
    return false if __age.nil?

    __age > (MINIMUM_VALID_AGE - 1)
  end

  # set a default name for an anonymous artist
  #
  # @assign default name to artist name database
  def set_default_name
    return true if name.present?

    self.name = DEFAULT_NAME
  end

  # calculate age from date of birth
  #
  # @returns calculated age
  def calculate_age
    return nil if dob.nil?

    birthday = Chronic.parse(self.try(:dob))
    if birthday
      age = ((Time.now - birthday.to_time)/(60*60*24*365)).floor
      return nil if age < 0
    end


    age
  end

  # assign calculated age
  #
  # @assigns calculated age to age
  def assign_or_update_age
    if age.nil? || dob.present? && dob.changed?
      self.age = calculate_age
    end
  end

end
