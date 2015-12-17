require 'rack/auth/digest/md5'

class Signature
  attr_reader :song
  attr_reader :password
  attr_reader :filename
  attr_reader :expiration_time
  attr_reader :source
  attr_reader :server_name

  delegate :id, to: :song

  def initialize(song, server= 'https://play.local.dev:453')
    @song            = song
    @password        = Rails.application.config.x.signature
    @filename        = song.read_attribute(:audio).gsub(/\.mp3/, '')
    @expiration_time = (Time.zone.now + 10.minutes).to_i
    @server_name     = server
    generate_signature
  end

  def generate_signature
    secure_str = "#{password}#{expiration_time}#{filename}"
    a          = Base64.encode64(Digest::MD5.digest(secure_str))
    @source    = a.tr("+/", "-_").sub('==', '').chomp
  end

  def generate_uri
    "#{server_name}/play/#{source}/#{song.id}/#{expiration_time}/#{filename}"
  end
end