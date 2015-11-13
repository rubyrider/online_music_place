module Backend
  class SongsController < BackendController
    before_action :set_backend_song, only: [:show, :edit, :update, :destroy]

    autocomplete :category, :name, :full => true
    autocomplete :artist, :name, :full => true
    autocomplete :album, :name, :full => true

    # GET /backend/songs
    # GET /backend/songs.json
    def index
      # @songs = SongPresenter.collect Song.filter_by_params(params).page(params[:page]).per(50)
      @songs = Song.filter_by_params(params).page(params[:page])
      @albums = Album.all.order(:name)
      @artists = Artist.all.order(:name)
      @categories = Category.all
    end

    # GET /backend/songs/1
    # GET /backend/songs/1.json
    def show
    end

    # GET /backend/songs/new
    def new
      @song = build_song_track
    end

    # GET /backend/songs/1/edit
    def edit
    end

    # POST /backend/songs
    # POST /backend/songs.json
    def create
      @song = Song.new(backend_song_params)

      respond_to do |format|
        if @song.save
          format.html { redirect_to [:backend, @song], notice: 'Song was successfully created.' }
          format.json { render :show, status: :created, location: @song }
        else
          format.html { render :new }
          format.json { render json: @song.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /backend/songs/1
    # PATCH/PUT /backend/songs/1.json
    def update
      @song = Song.find(params[:id])
      respond_to do |format|
        if @song.update(backend_song_params)
          format.html { redirect_to [:backend, @song], notice: 'Song was successfully updated.' }
          format.json { render :show, status: :ok, location: @song }
        else
          format.html { render :edit }
          format.json { render json: @song.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /backend/songs/1
    # DELETE /backend/songs/1.json
    def destroy
      @song.destroy
      respond_to do |format|
        format.html { redirect_to backend_songs_url, notice: 'Song was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # create song instances
    #
    # @returns song instances with track and demo track build
    def build_song_track
      @song = Song.new
      @song.build_track
      @song.build_demo_track

      @song
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_backend_song
      @song = SongPresenter.new Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_song_params
      params.require(:song).permit!
    end
  end
end
