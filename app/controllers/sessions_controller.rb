class SessionsController < Devise::SessionsController
  # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb

  # POST /resource/sign_in
  # Resets the authentication token each time! Won't allow you to login on two devices
  # at the same time (so does logout).
  before_filter :require_no_authentication, only: [:create]

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)

    # current_user.update authentication_token: nil

    respond_to do |format|
      format.html {
        redirect_to 'backend/index'
      }
      format.json {
        render :json => {
                   :user                 => current_user,
                   :status               => :ok,
                   :authentication_token => current_user.authentication_token
               }
      }
    end
  end

  # DELETE /resource/sign_out
  def destroy
    if current_user
      current_user.update authentication_token: nil
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    end

    respond_to do |format|
      format.html {
        redirect_to root_path
      }

      format.json {
        if current_user
          render :json => {}.to_json, :status => :ok
        else
          render :json => {}.to_json, :status => :unprocessable_entity
        end
      }
    end

    redirect_to root_path && return
  end
end