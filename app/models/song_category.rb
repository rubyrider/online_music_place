class SongCategory < ActiveRecord::Base
  belongs_to :song
  belongs_to :category
end
