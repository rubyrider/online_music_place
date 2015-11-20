class ApiController < ApplicationController
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
end

module Api
  module V1

  end
end
