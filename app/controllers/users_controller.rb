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
end
