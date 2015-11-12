module Api
  module V1
    class PlayListsController < ApiController
      before_action :set_play_list, only: [:show, :edit, :update, :destroy, :songs, :toggle_presence_in_play_list]

      # GET /play_lists
      # GET /play_lists.json
      def index
        @play_lists = PlayList.all
      end

      # GET /play_lists/1
      # GET /play_lists/1.json
      def show
        render json: @play_list
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
        @play_list = PlayList.new(play_list_params)

        respond_to do |format|
          if @play_list.save
            format.html { redirect_to @play_list, notice: 'Play list was successfully created.' }
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
        if @play_list.present?
          render json: @play_list.includes(:songs)
        else
          render json: {message: 'no playlist found'}
        end
      end

      def featured
        @play_lists = PlayList.where(:featured => true)
        render json: @play_lists
      end

      def songs
        @songs = @play_list.songs
        render :json => @songs
      end

      def toggle_presence_in_play_list
        user = User.find(params[:user_id]) rescue nil
        song = Song.find(params[:song_id]) rescue nil
        if user
          if song
            if @play_list
              if @play_list.songs.include? song
                if PlayListSong.where(song_id: song.id, play_list_id: @play_list.id).destroy_all
                  render json: { success: true, message: 'Successfully removed from playlist.' }
                else
                  render json: { success: false, message: 'Can not be removed from playlist.' }
                end
              else
                if PlayListSong.create(song_id: song.id, play_list_id: @play_list.id)
                  render json: { success: true, message: 'Successfully added to playlist.' }
                else
                  render json: { success: false, message: 'Can not be added to playlist.' }
                end
              end
            else
              render json: { success: false, status: :not_found, message: 'Play list not found!' }
            end
          else
            render json: { success: false, status: :not_found, message: 'Song not found!' }
          end
        else
          render json: { success: false, status: :not_found, message: 'User not found!' }
        end

      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_play_list
        @play_list = PlayList.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def play_list_params
        params[:play_list]
      end
    end
  end
end
