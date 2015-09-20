class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]

  # GET /backend/advertisements
  # GET /backend/advertisements.json
  def index
    @advertisements = Advertisement.all
  end

  # GET /backend/advertisements/1
  # GET /backend/advertisements/1.json
  def show
  end

  # GET /backend/advertisements/new
  def new
    @advertisement = Advertisement.new
  end

  # GET /backend/advertisements/1/edit
  def edit
  end

  # POST /backend/advertisements
  # POST /backend/advertisements.json
  def create
    @advertisement = Advertisement.new(backend_advertisement_params)

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully created.' }
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
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully updated.' }
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
      params[:advertisement]
    end
end
