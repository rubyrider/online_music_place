class BackendController < ApplicationController
  layout 'backend'

  add_breadcrumb "Dashboard", "/backend/users"

  def prevent_non_admin_access!

  end

end
