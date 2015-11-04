module Backend
  class AlbumsController < BackendController
    before_action :set_backend_album, only: [:show, :edit, :update, :destroy]
    autocomplete :category, :name, :full => true
    autocomplete :artist, :name, :full => true

    add_breadcrumb "Album".freeze, :backend_albums_path

    # GET /backend/albums
    # GET /backend/albums.json
    def index
      add_breadcrumb "List".freeze, :backend_albums_path

      @albums = AlbumPresenter.collect(Album.filter_by_params(params))
      @artists = Artist.all.order(:name)
      @categories = Category.all
    end

    # GET /backend/albums/1
    # GET /backend/albums/1.json
    def show
      render json: @album.includes(:songs)
    end

    # GET /backend/albums/new
    def new
      add_breadcrumb "Create New".freeze, :new_backend_album_path

      @album = Album.new
    end

    # GET /backend/albums/1/edit
    def edit
      add_breadcrumb "#{@album.name}", backend_album_path(@album.to_param)
      add_breadcrumb "Edit".freeze
    end

    # POST /backend/albums
    # POST /backend/albums.json
    def create
      @album = Album.new(backend_album_params)

      respond_to do |format|
        if @album.save
          format.html { redirect_to backend_album_path(@album), notice: 'Album was successfully created.' }
          format.json { render :show, status: :created, location: backend_album_path(@album) }
        else
          format.html { render :new }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /backend/albums/1
    # PATCH/PUT /backend/albums/1.json
    def update
      respond_to do |format|
        if @album.update(backend_album_params)
          format.html { redirect_to [:backend, @album], notice: 'Album was successfully updated.' }
          format.json { render :show, status: :ok, location: @album }
        else
          format.html { render :edit }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /backend/albums/1
    # DELETE /backend/albums/1.json
    def destroy
      @album.destroy
      respond_to do |format|
        format.html { redirect_to backend_albums_url, notice: 'Album was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_album
      @album = AlbumPresenter.new(Album.find(params[:id]))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_album_params
      params.require(:album).permit!
    end
  end
end
