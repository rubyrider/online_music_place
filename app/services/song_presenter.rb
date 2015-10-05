class SongPresenter < BasePresenter

  def album_title
    return Album.new.default_title if object.album.nil?

    object.album.name
  end

end