module Backend
  class CategoriesController < BackendController
    before_action :set_backend_category, only: [:show, :edit, :update, :destroy]

    # GET /backend/categories
    # GET /backend/categories.json
    def index
      @categories = Category.filter_by_params(params)
    end

    # GET /backend/categories/1
    # GET /backend/categories/1.json
    def show
    end

    # GET /backend/categories/new
    def new
      @category = Category.new
    end

    # GET /backend/categories/1/edit
    def edit
    end

    # POST /backend/categories
    # POST /backend/categories.json
    def create
      @category = Category.new(backend_category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to backend_category_path(@category), notice: 'Category was successfully created.' }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /backend/categories/1
    # PATCH/PUT /backend/categories/1.json
    def update
      respond_to do |format|
        if @category.update(backend_category_params)
          format.html { redirect_to backend_category_path(@category), notice: 'Category was successfully updated.' }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /backend/categories/1
    # DELETE /backend/categories/1.json
    def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to backend_categories_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_category_params
      params[:category].permit!
    end
  end
end
