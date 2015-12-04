module Api
  module V1
    class PlayListsController < ApiController
      before_action :set_play_list, only: [:show, :edit, :update, :destroy, :songs]
      acts_as_token_authentication_handler_for User, only: [:toggle_presence_in_play_list, :edit, :update, :destroy]

      # GET /play_lists
      # GET /play_lists.json
      def index
        if params[:system].present?
          @play_lists = PlayList.where(:system_play_list => true).page(params[:page])
        else
          if current_user
            @play_lists = current_user.play_lists.page(params[:page])
          end
        end
        render json: @play_lists
      end

      # GET /play_lists/1
      # GET /play_lists/1.json
      def show

      end

      # GET /play_lists/new
      def new
        @play_list = PlayList.new
      end

      # GET /play_lists/1/edit
      def edit
      end

      # POST /play_lists
      # POST /play_lists.json
      def create
        @play_list = PlayList.new()
        @play_list.user_id = current_user.id
        @play_list.name = params[:play_list]['name']
        respond_to do |format|
          if @play_list.save
            format.html { redirect_to root_path, notice: 'Play list was successfully created.' }
            format.json { render :show, status: :created, location: @play_list }
          else
            format.html { render :new }
            format.json { render json: @play_list.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /play_lists/1
      # PATCH/PUT /play_lists/1.json
      def update
        respond_to do |format|
          if @play_list.update(play_list_params)
            format.html { redirect_to @play_list, notice: 'Play list was successfully updated.' }
            format.json { render :show, status: :ok, location: @play_list }
          else
            format.html { render :edit }
            format.json { render json: @play_list.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /play_lists/1
      # DELETE /play_lists/1.json
      def destroy
        @play_list.destroy
        respond_to do |format|
          format.html { redirect_to play_lists_url, notice: 'Play list was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      def surprise_me
        @play_list = PlayList.where(system_play_list: true).sample
        render json: [{play_list: @play_list, songs: @play_list.songs}]
      end

      def featured
        @play_lists = PlayList.where(:featured => true)
        render json: @play_lists
      end

      def songs
        @songs = @play_list.songs.page(params[:page]).per(20)
        render :json => @songs
      end

      def toggle_presence_in_play_list
        user = current_user
        song = Song.find(params[:song_id]) rescue nil
        @play_list = PlayList.find(params[:play_list_id])
        if user
          if song
            if @play_list
              if @play_list.songs.include? song
                if PlayListSong.where(song_id: song.id, play_list_id: @play_list.id).destroy_all
                  # render json: { success: true, message: 'Successfully removed from playlist.' }
                else
                  # render json: { success: false, message: 'Can not be removed from playlist.' }
                end
              else
                if PlayListSong.create(song_id: song.id, play_list_id: @play_list.id)
                  # render json: { success: true, message: 'Successfully added to playlist.' }
                else
                  # render json: { success: false, message: 'Can not be added to playlist.' }
                end
              end
            else
              # render json: { success: false, status: :not_found, message: 'Play list not found!' }
            end
          else
            # render json: { success: false, status: :not_found, message: 'Song not found!' }
          end
        else
          # render json: { success: false, status: :not_found, message: 'User not found!' }
        end
        respond_to do |format|
          format.js
        end

      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_play_list
        @play_list = PlayList.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def play_list_params
        params.require(:play_list).permit(:name)
      end
    end
  end
end
