class BackendController < ApplicationController
  layout 'backend'

  add_breadcrumb "Dashboard", "/backend/users"
  before_filter :authenticate_user!

  def prevent_non_admin_access!
    if current_user.admin?
      redirect_to root_path && return
    end
  end

end
