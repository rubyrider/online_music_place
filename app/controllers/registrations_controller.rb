class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Successfully signed up' }
        format.json { render json => { :state => { :code => 0 }, :data => @user } }
      end
    else
      respond_to do |format|
        format.json { render :json => { :state => { :code => 1, :messages => @user.errors.full_messages } } }
        format.html { render :new, error: 'Failed to signed you up' }
      end
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :avatar, :first_name, :last_name)
  end
end