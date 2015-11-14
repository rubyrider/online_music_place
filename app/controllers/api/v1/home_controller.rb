class Api::V1::HomeController < ApplicationController
  def index
  end

  def search
    @songs = Song.search(params[:query])
    @albums = Album.search(params[:query])
    @artists = Artist.search(params[:query])

    render json: { songs: @songs, albums: @albums, artists: @artists }
  end
end
