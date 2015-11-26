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
  belongs_to :user
  has_many :liked_play_lists
  has_many :users, through: :liked_play_lists
  has_many :play_list_songs
  has_many :songs, through: :play_list_songs

  accepts_nested_attributes_for :play_list_songs,
                                reject_if: :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :songs

  def creator
    self.user
  end

  def favorite_by?(user)
    self.users.include?(user)
  end
end
