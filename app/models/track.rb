# == Schema Information
#
# Table name: tracks
#
#  id                 :integer          not null, primary key
#  song_id            :integer
#  name               :string(255)
#  duration           :string(255)
#  demo_song_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  attachment         :string(255)
#  audio_file_name    :string(255)
#  audio_content_type :string(255)
#  audio_file_size    :integer
#  audio_updated_at   :datetime
#
# Indexes
#
#  index_tracks_on_demo_song_id  (demo_song_id)
#  index_tracks_on_song_id       (song_id)
#

class Track < ActiveRecord::Base
  belongs_to :song
  belongs_to :song_as_demo, class_name: 'Song', foreign_key: :demo_song_id

  # mount_uploader :attachment, TrackUploader

  has_attached_file :audio
  validates_attachment_content_type :audio, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

end
