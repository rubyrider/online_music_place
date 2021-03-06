module Api
  module V1
    class ArtistsController < ApiController
      before_action :set_artist, only: [:show, :edit, :update, :destroy, :toggle_like]
      acts_as_token_authentication_handler_for User, only: [:toggle_like]

      # GET /artists
      # GET /artists.json
      def index
        @artists = Artist.limit(12)
        if @artists
          render json: @artists
        else
          render json: []
        end

      end

      # GET /artists/1
      # GET /artists/1.json
      def show
        @artist = Artist.find(params[:id])
      end

      def get_for_jplayer
        artist = Artist.find(params[:id])
        @songs = artist.songs
      end

      # GET /artists/new
      # def new
      #   @artist = Artist.new
      # end

      # GET /artists/1/edit
      # def edit
      # end

      # POST /artists
      # POST /artists.json
      # def create
      #   @artist = Artist.new(artist_params)
      #
      #   respond_to do |format|
      #     if @artist.save
      #       format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
      #       format.json { render :show, status: :created, location: @artist }
      #     else
      #       format.html { render :new }
      #       format.json { render json: @artist.errors, status: :unprocessable_entity }
      #     end
      #   end
      # end

      # PATCH/PUT /artists/1
      # PATCH/PUT /artists/1.json
      # def update
      #   respond_to do |format|
      #     if @artist.update(artist_params)
      #       format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
      #       format.json { render :show, status: :ok, location: @artist }
      #     else
      #       format.html { render :edit }
      #       format.json { render json: @artist.errors, status: :unprocessable_entity }
      #     end
      #   end
      # end

      # DELETE /artists/1
      # DELETE /artists/1.json
      # def destroy
      #   @artist.destroy
      #   respond_to do |format|
      #     format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      #     format.json { head :no_content }
      #   end
      # end

      def toggle_like
        if user == current_user
          if user.artists.include? @artist
            if LikedArtist.where(user_id: user.id, artist_id: @artist.id).destroy_all
              render :json => {success: true, message: 'Successfully removed from favorite.'}
              return
            else
              render :json => {success: false, message: "Can't remove!"}
              return
            end
          else
            if LikedArtist.create(user_id: user.id, artist_id: @artist.id)
              render :json => {success: true, message: 'Successfully added to favorite.'}
              return
            else
              render :json => {success: false, message: "Can't be added to favorite!"}
              return
            end
          end
        end
      else
        render json: { success: false, message: 'You are not authorized!' }
        return
      end

      private
      def user 
        User.find(params[:user_id])
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_artist
        @artist = Artist.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def artist_params
        params[:artist]
      end
    end
  end
end
