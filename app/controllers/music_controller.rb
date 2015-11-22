class MusicController < ApplicationController
  def index
    @playlists = current_user.play_lists
  end
end
