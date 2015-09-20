class SongLanguage < ActiveRecord::Base
  belongs_to :song
  belongs_to :language
end
