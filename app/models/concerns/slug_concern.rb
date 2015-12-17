module SlugConcern

  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :slug_candidate, use: [:slugged, :finders]
  end

  #
  # to pick the member for generating slug
  # should be override!
  def slug_candidate
    :name
  end

  # should be override
  def should_generate_new_friendly_id?
    name.blank? || name_changed? || super
  end

  # define your object level methods here...

  # def method_one
  #   puts "wow!! working!!!"
  # end

  # included do

  # #type your class methods here...

  # end

  # class Post < ActiveRecord::Base
  #    include SlugConcern
  # end

end
