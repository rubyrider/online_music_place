class UsersController < ApplicationController
  before_filter :authenticate_user!

  def profile
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def play_lists
    @play_lists = current_user.play_lists
  end

  def update
    @user = current_user
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.avatar = params[:avatar]

    if @user.save
      redirect_to profile_user_path, notice: 'Successfully updated.'
    else
      redirect_to profile_user_path, notice: "Can't updated."
    end
  end

  def finish_signup
    @user = User.find(params[:id])
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        # @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to root_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  def user_params
    accessible = [ :name, :email ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
