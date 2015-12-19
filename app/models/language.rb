# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  key        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Language < ActiveRecord::Base
  include SlugConcern

  validates :name, :presence => true, :uniqueness => true
  validates :key, :presence => true, :uniqueness => true

  has_many :song_languages, dependent: :delete_all
  has_many :songs, through: :song_languages

  def as_json(options = nil)
    {
        id:         self.to_param,
        name:       self.name,
        created:    self.created_at,
        updated_at: self.updated_at,
        songs:      self.songs,
    }
  end

end
