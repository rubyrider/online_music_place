class MusicController < ApplicationController
  def index
    @playlists = PlayList.where(system_play_list: true, featured: true)
    @left_side_play_list = PlayList.left_side_playlists
  end
end
