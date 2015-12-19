module Backend::SongsHelper
end

module ActionView
  module Helpers
    def text_field(object_name, method, options = {})
      if tokeninput?(options) && need_to_pre_populate?(object_name, method, options)
        options[:data][:tokeninput][:options][:prePopulate] = items_to_prepopulation(object_name, method, options)
      end
      Tags::TextField.new(object_name, method, self, options).render
    end

    private

    def tokeninput?(options)
      options[:data] && options[:data][:tokeninput]
    end

    def need_to_pre_populate?(object_name, method, options)
      Array.wrap(passed_or_saved_items(object_name, method, options)).any?
    end

    def passed_or_saved_items(object_name, method, options)
      (params[object_name] && params[object_name][method]) || (options[:object] && options[:object][method]) || []
    end

    def token_value(options)
      default = :id
      begin
        options[:data][:tokeninput][:options][:tokenValue] || default
      rescue
        default
      end
    end

    def items_to_prepopulation(object_name, method, options)
      token_value = token_value(options)

      items = passed_or_saved_items(object_name, method, options)

      if method == :album_id
        items = Array.wrap({id: @song.album_id, name: @song.album.name}) if @song.album.present?
      end

      items
    end
  end
end

