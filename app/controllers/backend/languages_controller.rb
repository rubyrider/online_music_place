class Backend::LanguagesController < BackendController
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Language Management".freeze, :backend_languages_path


  # GET /backend/languages
  # GET /backend/languages.json
  def index
    add_breadcrumb "List".freeze, :backend_languages_path

    @languages = Language.all
  end

  def language_queries
    @artists = Language.limit(10).where('name LIKE ?', "%#{params[:q]}%").collect {|artist| {id: artist.id, name: artist.name}}
    render json: @artists.to_json, only: [:id, :name]
  end

  # GET /backend/languages/1
  # GET /backend/languages/1.json
  def show
    add_breadcrumb "#{@language.name}".freeze, backend_language_path(@language)
  end

  # GET /backend/languages/new
  def new
    add_breadcrumb "Create New Language".freeze, new_backend_language_path

    @language = Language.new
  end

  # GET /backend/languages/1/edit
  def edit
  end

  # POST /backend/languages
  # POST /backend/languages.json
  def create
    @language = Language.new(language_params)

    respond_to do |format|
      if @language.save
        format.html { redirect_to [:backend, @language], notice: 'Language was successfully created.' }
        format.json { render :show, status: :created, location: @language }
      else
        format.html { render :new }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/languages/1
  # PATCH/PUT /backend/languages/1.json
  def update
    respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to [:backend, @language], notice: 'Language was successfully updated.' }
        format.json { render :show, status: :ok, location: @language }
      else
        format.html { render :edit }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/languages/1
  # DELETE /backend/languages/1.json
  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to backend_languages_url, notice: 'Language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_params
      params.require(:language).permit!
    end
end
