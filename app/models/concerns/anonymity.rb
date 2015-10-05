module Anonymity

  extend ActiveSupport::Concern

  ANONYMITY_COLUMN = 'anonymous'.freeze

  def mark_as_anonymous
    self[ANONYMITY_COLUMN]  = true
  end

  def unmark_as_anonymous
    self[ANONYMITY_COLUMN] =  false
  end

  def unmark_as_anonymous!
    unmark_as_anonymous
    save!
  end

  def mark_as_anonymous!
    mark_as_anonymous
    save!
  end
end