module Api
  module V1
    class SearchController < ApiController
      # GET /songs
      # GET /songs.json
      def index

      end

      private
      # Never trust parameters from the scary internet, only allow the white list through.
      def query_param
        params[:query]
      end
    end
  end
end
