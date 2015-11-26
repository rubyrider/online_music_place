class UsersController < ApplicationController
  before_filter :authenticate_user!

  def profile
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update

  end
end
