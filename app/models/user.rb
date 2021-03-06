class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :avatar, UserAvatarUploader

  has_many :liked_songs
  has_many :songs, through: :liked_songs
  has_many :liked_albums
  has_many :albums, through: :liked_albums
  has_many :liked_play_lists
  has_many :play_lists, through: :liked_play_lists
  has_many :play_list_songs, through: :play_lists, source: :songs
  has_many :liked_artists
  has_many :artists, through: :liked_artists
  has_many :play_lists
  has_many :identities

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  include UserRole

  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  belongs_to :subscription

  validates :role, :first_name, :last_name,:presence => true
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def as_json(options = nil)
    {
        id: self.id,
        name: self.full_name,
        avater: self.avatar,
        created_at: self.created_at,
        updated_at: self.updated_at,
        role: self.current_role,
        songs: self.songs,
        albums: self.albums,
        artists: self.artists,
    }
  end

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
            first_name: auth.extra.raw_info.name.split(/\s+/)[0],
            last_name: auth.extra.raw_info.name.split(/\s+/).last,
            #username: auth.info.nickname || auth.uid,
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!  if user.respond_to? :skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
