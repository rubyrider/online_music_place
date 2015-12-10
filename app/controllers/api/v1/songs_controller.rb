module Api
  module V1
    class SongsController < ApiController
      before_action :set_song, only: [:show, :edit, :update, :destroy, :toggle_like, :play_song]
      acts_as_token_authentication_handler_for User, only: [:toggle_like]

      # GET /songs
      # GET /songs.json
      def index
        @songs = Song.all.order(:updated_at).first(12)
        render :json => @songs
      end

      def play_song
        send_file @song.audio.path
      end

      # GET /songs/1
      # GET /songs/1.json
      def show
        @song = Song.find(params[:id])
        render :json => {song: @song, album: @song.album}
      end

      # GET /songs/new
      # def new
      #   @song = Song.new
      # end

      # GET /songs/1/edit
      def edit
      end

      # POST /songs
      # POST /songs.json
      # def create
      #   @song = Song.new(song_params)
      #
      #   respond_to do |format|
      #     if @song.save
      #       format.html { redirect_to @song, notice: 'Song was successfully created.' }
      #       format.json { render :show, status: :created, location: @song }
      #     else
      #       format.html { render :new }
      #       format.json { render json: @song.errors, status: :unprocessable_entity }
      #     end
      #   end
      # end

      # PATCH/PUT /songs/1
      # PATCH/PUT /songs/1.json
      # def update
      #   respond_to do |format|
      #     if @song.update(song_params)
      #       format.html { redirect_to @song, notice: 'Song was successfully updated.' }
      #       format.json { render :show, status: :ok, location: @song }
      #     else
      #       format.html { render :edit }
      #       format.json { render json: @song.errors, status: :unprocessable_entity }
      #     end
      #   end
      # end

      # DELETE /songs/1
      # DELETE /songs/1.json
      # def destroy
      #   @song.destroy
      #   respond_to do |format|
      #     format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      #     format.json { head :no_content }
      #   end
      # end

      def toggle_like
        if user == current_user
          if user.songs.include? @song
            if LikedSong.where(user_id: user.id, song_id: @song.id).destroy_all
              render :json => {success: true, message: 'Successfully removed from favorite.'}
              return
            else
              render :json => {success: false, message: "Can't remove!"}
              return
            end
          else
            if LikedSong.create(user_id: user.id, song_id: @song.id)
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
        @user = User.find(params[:user_id])
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_song
        @song = Song.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def song_params
        params[:song]
      end
    end
  end
end
