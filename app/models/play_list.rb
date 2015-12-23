# == Schema Information
#
# Table name: play_lists
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  user_id          :integer
#  system_play_list :boolean
#  aasm_state       :string(255)
#  share_count      :integer
#  featured         :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class PlayList < ActiveRecord::Base

  include SlugConcern

  searchkick

  mount_uploader :cover, PlayListCoverUploader

  belongs_to :user
  has_many :liked_play_lists, dependent: :delete_all
  has_many :users, through: :liked_play_lists
  has_many :play_list_songs, dependent: :delete_all
  has_many :songs, through: :play_list_songs

  accepts_nested_attributes_for :play_list_songs,
                                reject_if:     :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :songs

  scope :left_side_playlists, -> { where(left_side: true) }

  def creator
    self.user
  end

  def favorite_by?(user = nil)
    return false if user.nil?

    self.users.include?(user)
  end

  def as_json(options= nil)
    {
        id:         self.to_param,
        name:       self.name,
        created_at: self.created_at,
        updated_at: self.updated_at,
        cover:      self.cover,
        favorite:   false
    }
  end

  def with_user_preference(current_user = nil)
    self.as_json.merge({
                           favorite: self.favorite_by?(current_user)

                       })

  end
end
