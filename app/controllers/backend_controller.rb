class BackendController < ApplicationController
  layout 'backend'

  add_breadcrumb "Dashboard", "/backend/users"
  before_filter :authenticate_user!
  before_filter :prevent_non_admin_access!

  private

  def prevent_non_admin_access!

    if !current_user.admin?
      redirect_to root_path
    end
  end

end
