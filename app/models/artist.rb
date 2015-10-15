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

  mount_uploader :cover, ArtistCoverUploader
  mount_uploader :photo, ArtistPhotoUploader

  DEFAULT_NAME = 'Anonymous Singer'.freeze

  MINIMUM_VALID_AGE = 4

  GENDER = {
      :not_mentioned => 0,
      :male => 1,
      :female => 2,
      :other => 3
  }

  include Anonymity

  has_many :song_artists
  has_many :songs
  has_many :album_artists
  has_many :albums
  has_many :liked_artists
  has_many :users, through: :liked_artists

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
