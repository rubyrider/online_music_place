module Api
  module V1
    class LanguagesController < ApiController
      before_action :set_genre, only: [:show]
      acts_as_token_authentication_handler_for User, only: [:toggle_presence_in_play_list, :edit, :update, :destroy]

      # GET /play_lists
      # GET /play_lists.json

      def show
           render json: @language.as_json
      end

      private

      def set_genre
        @language = Language.find(params[:id])
      end
    end
  end
end
