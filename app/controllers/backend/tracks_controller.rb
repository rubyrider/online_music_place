module Backend
  class TracksController < BackendController
    before_action :set_backend_track, only: [:show, :edit, :update, :destroy]

    # GET /backend/tracks
    # GET /backend/tracks.json
    def index
      @tracks = Track.all
    end

    # GET /backend/tracks/1
    # GET /backend/tracks/1.json
    def show
    end

    # GET /backend/tracks/new
    def new
      @track = Track.new
    end

    # GET /backend/tracks/1/edit
    def edit
    end

    # POST /backend/tracks
    # POST /backend/tracks.json
    def create
      @track = Track.new(backend_track_params)

      respond_to do |format|
        if @track.save
          format.html { redirect_to @track, notice: 'Track was successfully created.' }
          format.json { render :show, status: :created, location: @track }
        else
          format.html { render :new }
          format.json { render json: @track.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /backend/tracks/1
    # PATCH/PUT /backend/tracks/1.json
    def update
      respond_to do |format|
        if @track.update(backend_track_params)
          format.html { redirect_to @track, notice: 'Track was successfully updated.' }
          format.json { render :show, status: :ok, location: @track }
        else
          format.html { render :edit }
          format.json { render json: @track.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /backend/tracks/1
    # DELETE /backend/tracks/1.json
    def destroy
      @track.destroy
      respond_to do |format|
        format.html { redirect_to backend_tracks_url, notice: 'Track was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_track_params
      params[:track]
    end
  end
end
