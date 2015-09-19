class AlbumCategory < ActiveRecord::Base
  belongs_to :album
  belongs_to :category
end
