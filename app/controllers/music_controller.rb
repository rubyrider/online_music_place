class MusicController < ApplicationController
  def index
    if current_user
      @playlists = current_user.play_lists
    else
      @playlists = []
    end
  end
end
