# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base

  include SlugConcern

  has_many :song_categories, dependent: :delete_all
  has_many :songs, through: :song_categories
  has_many :album_categories, dependent: :delete_all
  has_many :albums, through: :album_categories
  has_many :genres, class_name: 'Category', foreign_key: :parent_id

  validates :name, :presence => true, uniqueness: true

  scope :main, -> { where(parent_id: nil) }

  def as_json(options = nil)
    {
        id:         self.to_param,
        name:       self.name,
        created:    self.created_at,
        updated_at: self.updated_at,
        songs:      self.songs,
        parent:     self.genres
    }
  end

  def self.filter_by_params(params)
    results = Category.all
    if params[:name].present?
      results = results.where('name LIKE ?', "%#{params[:name]}%")
    end

    results
  end
end
