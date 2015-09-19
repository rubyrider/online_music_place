class Track < ActiveRecord::Base
  belongs_to :song
  belongs_to :song_as_demo, class_name: 'Song', foreign_key: :demo_song_id
end
