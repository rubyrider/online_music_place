require 'rack/auth/digest/md5'

class Signature
  attr_reader :song
  attr_reader :password
  attr_reader :filename
  attr_reader :expiration_time
  attr_reader :source
  attr_reader :server_name

  delegate :id, to: :song

  def initialize(song)
    @song            = song
    @password        = Rails.application.config.x.signature
    @filename        = song.read_attribute(:audio).gsub(/\.mp3/, '')
    @expiration_time = (Time.zone.now + 10.minutes).to_i
    @server_name     = ENV['SHOST']
    generate_signature
  end

  def generate_signature
    secure_str = "#{password}#{expiration_time}#{filename}"
    a          = Base64.encode64(Digest::MD5.digest(secure_str))
    @source    = a.tr("+/", "-_").sub('==', '').chomp
  end

  def generate_uri
    "#{server_name}/#{song.id}/#{filename}.mp3"
  end
end