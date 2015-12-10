class Backend::AdvertisementsController < BackendController
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Advertisement Management".freeze, :backend_advertisements_path


  # GET /backend/advertisements
  # GET /backend/advertisements.json
  def index
    add_breadcrumb "List".freeze, :backend_advertisements_path
    @advertisements = Advertisement.all
  end

  # GET /backend/advertisements/1
  # GET /backend/advertisements/1.json
  def show
    add_breadcrumb "#{@advertisement.title}".freeze, backend_advertisement_path(@advertisement)
  end

  # GET /backend/advertisements/new
  def new
    add_breadcrumb "Create".freeze, :new_backend_advertisement_path
    @advertisement = Advertisement.new
  end

  # GET /backend/advertisements/1/edit
  def edit
    add_breadcrumb "#{@advertisement.title}".freeze, backend_advertisement_path(@advertisement)
    add_breadcrumb "Edit".freeze, edit_backend_advertisement_path(@advertisement)
  end

  # POST /backend/advertisements
  # POST /backend/advertisements.json
  def create
    @advertisement = Advertisement.new(backend_advertisement_params)

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to backend_advertisement_path(@advertisement), notice: 'Advertisement was successfully created.' }
        format.json { render :show, status: :created, location: @advertisement }
      else
        format.html { render :new }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/advertisements/1
  # PATCH/PUT /backend/advertisements/1.json
  def update
    respond_to do |format|
      if @advertisement.update(backend_advertisement_params)
        format.html { redirect_to backend_advertisement_path(@advertisement), notice: 'Advertisement was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertisement }
      else
        format.html { render :edit }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/advertisements/1
  # DELETE /backend/advertisements/1.json
  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to backend_advertisements_url, notice: 'Advertisement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def backend_advertisement_params
    params.require(:advertisement).permit([
                                              :id,
                                              :title,
                                              :content,
                                              :from_date,
                                              :end_date,
                                              :featured,
                                              :ad_position_id,
                                              :height,
                                              :width,
                                              :modal,
                                              :custom_css,
                                              :created_at,
                                              :updated_at,
                                              :left_position,
                                              :right_position
                                          ]
    )
  end
end
