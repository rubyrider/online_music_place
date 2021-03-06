module Backend
  class ArtistsController < BackendController
    before_action :set_backend_artist, only: [:show, :edit, :update, :destroy]
    autocomplete :musical_band, :name, :full => true

    # GET /backend/artists
    # GET /backend/artists.json
    def index
      @artists = ArtistPresenter.collect Artist.filter_by_params(params)
      @musical_bands = MusicalBand.limit(20).order(:name)
    end

    def artist_queries
      @artists = Artist.limit(10).where('name LIKE ?', "%#{params[:q]}%").collect {|artist| {id: artist.id, name: artist.name}}
      render json: @artists.to_json, only: [:id, :name]
    end

    # GET /backend/artists/1
    # GET /backend/artists/1.json
    def show
    end

    # GET /backend/artists/new
    def new
      @artist = Artist.new
    end

    # GET /backend/artists/1/edit
    def edit
    end

    # POST /backend/artists
    # POST /backend/artists.json
    def create
      @artist = Artist.new(backend_artist_params)

      respond_to do |format|
        if @artist.save
          format.html { redirect_to [:backend, @artist], notice: 'Artist was successfully created.' }
          format.json { render :show, status: :created, location: @artist }
        else
          format.html { render :new }
          format.json { render json: @artist.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /backend/artists/1
    # PATCH/PUT /backend/artists/1.json
    def update
      @artist = Artist.find(params[:id])
      respond_to do |format|
        if @artist.update(backend_artist_params)
          format.html { redirect_to [:backend , @artist], notice: 'Artist was successfully updated.' }
          format.json { render :show, status: :ok, location: @artist }
        else
          format.html { render :edit }
          format.json { render json: @artist.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /backend/artists/1
    # DELETE /backend/artists/1.json
    def destroy
      @artist.destroy
      respond_to do |format|
        format.html { redirect_to backend_artists_url, notice: 'Artist was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_artist
      @artist = ArtistPresenter.new Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_artist_params
      params.require(:artist).permit!
    end
  end
end
