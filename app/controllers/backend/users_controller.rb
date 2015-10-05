module Backend
  class UsersController < BackendController
    add_breadcrumb "User".freeze, :backend_users_path

    before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

    # GET /admin/users
    # GET /admin/users.json
    def index
      add_breadcrumb "List".freeze, :backend_users_path
      @users = UserPresenter.collect(User.all)
    end

    # GET /admin/users/1
    # GET /admin/users/1.json
    def show
      add_breadcrumb "#{@user.email}", backend_user_path(params.require(:id))
    end

    # GET /admin/users/new
    def new
      add_breadcrumb "New".freeze, new_backend_user_path
      @user = User.new
    end

    # GET /admin/users/1/edit
    def edit
      add_breadcrumb "#{@user.email}", backend_user_path(params.require(:id))
      add_breadcrumb "Edit".freeze, new_backend_user_path(params.require(:id))
    end

    # POST /admin/users
    # POST /admin/users.json
    def create
      @user = User.new(admin_user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to [:backend, @user], notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/users/1
    # PATCH/PUT /admin/users/1.json
    def update
      respond_to do |format|
        if @user.update(admin_user_params)
          format.html { redirect_to [:backends, @user], notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/users/1
    # DELETE /admin/users/1.json
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to backend_users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @user = UserPresenter.new(User.find(params.require(:id)))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role, :subscription_id)
    end
  end
end
