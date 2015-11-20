module Backend
  class MusicalBandsController < BackendController
    before_action :set_musical_band, only: [:show, :edit, :update, :destroy]

    # GET /musical_bands
    # GET /musical_bands.json
    def index
      @musical_bands = MusicalBand.all
    end

    # GET /musical_bands/1
    # GET /musical_bands/1.json
    def show
    end

    # GET /musical_bands/new
    def new
      @musical_band = MusicalBand.new
    end

    # GET /musical_bands/1/edit
    def edit
    end

    # POST /musical_bands
    # POST /musical_bands.json
    def create
      @musical_band = MusicalBand.new(musical_band_params)

      respond_to do |format|
        if @musical_band.save
          format.html { redirect_to backend_musical_band_path(@musical_band), notice: 'Musical band was successfully created.' }
          format.json { render :show, status: :created, location: @musical_band }
        else
          format.html { render :new }
          format.json { render json: @musical_band.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /musical_bands/1
    # PATCH/PUT /musical_bands/1.json
    def update
      respond_to do |format|
        if @musical_band.update(musical_band_params)
          format.html { redirect_to backend_musical_band_path(@musical_band), notice: 'Musical band was successfully updated.' }
          format.json { render :show, status: :ok, location: @musical_band }
        else
          format.html { render :edit }
          format.json { render json: @musical_band.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /musical_bands/1
    # DELETE /musical_bands/1.json
    def destroy
      @musical_band.destroy
      respond_to do |format|
        format.html { redirect_to backend_musical_bands_url, notice: 'Musical band was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_musical_band
      @musical_band = MusicalBand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def musical_band_params
      params[:musical_band].permit!
    end
  end

end