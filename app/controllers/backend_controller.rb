class BackendController < ApplicationController
  layout 'backend'

  add_breadcrumb "Dashboard", "/backend/users"
  before_filter :authenticate_user!

  def prevent_non_admin_access!

  end

end
