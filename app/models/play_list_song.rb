class PlayListSong < ActiveRecord::Base
  belongs_to :play_list
  belongs_to :song
end
