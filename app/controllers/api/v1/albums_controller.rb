module Api
  module V1
    class AlbumsController < ApiController
      before_action :set_album, only: [:show, :edit, :update, :destroy, :toggle_like, :songs]
      acts_as_token_authentication_handler_for User, only: [:toggle_like]

      # GET /albums
      # GET /albums.json
      def index
        @albums = Album.all
        render json: @albums
        # @albums = AlbumPresent.collect(Album.all)
      end

      # GET /albums/1
      # GET /albums/1.json
      def show
        render json: @album.to_json(:include => [:songs])
      end

      # GET /albums/new
      # def new
      #   @album = Album.new
      # end

      # GET /albums/1/edit
      def edit
      end

      # POST /albums
      # POST /albums.json
      # def create
      #   @album = Album.new(album_params)
      #
      #   respond_to do |format|
      #     if @album.save
      #       format.html { redirect_to @album, notice: 'Album was successfully created.' }
      #       format.json { render :show, status: :created, location: @album }
      #     else
      #       format.html { render :new }
      #       format.json { render json: @album.errors, status: :unprocessable_entity }
      #     end
      #   end
      # end

      # PATCH/PUT /albums/1
      # PATCH/PUT /albums/1.json
      # def update
      #   respond_to do |format|
      #     if @album.update(album_params)
      #       format.html { redirect_to @album, notice: 'Album was successfully updated.' }
      #       format.json { render :show, status: :ok, location: @album }
      #     else
      #       format.html { render :edit }
      #       format.json { render json: @album.errors, status: :unprocessable_entity }
      #     end
      #   end
      # end

      # DELETE /albums/1
      # DELETE /albums/1.json
      # def destroy
      #   @album.destroy
      #   respond_to do |format|
      #     format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      #     format.json { head :no_content }
      #   end
      # end

      def toggle_like
        if user == current_user
          if user.albums.include? @album
            if LikedAlbum.where(user_id: user.id, album_id: @album.id).destroy_all
              render :json => {success: true, message: 'Successfully removed from favorite.'}
              return
            else
              render :json => {success: false, message: "Can't remove!"}
              return
            end
          else
            if LikedAlbum.create(user_id: user.id, album_id: @album.id)
              render :json => {success: true, message: 'Successfully added to favorite.'}
              return
            else
              render :json => {success: false, message: "Can't be added to favorite!"}
              return
            end
          end
        else
          render json: { success: false, message: 'You are not authorized!' }
          return
        end
      end

      def songs
        @songs = @album.songs
        render :json => @songs
      end

      def new_releases
        @album = Album.where(new_release: true)
        render json: @album
      end

      private
      def user
        User.find(params[:user_id])
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_album
        @album = Album.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def album_params
        params.require(:album).permit!
      end
    end
  end
end
