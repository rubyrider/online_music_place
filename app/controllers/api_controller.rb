class ApiController < ApplicationController
  acts_as_token_authentication_handler_for User
end

module Api
  module V1

  end
end
