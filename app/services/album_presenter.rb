class AlbumPresenter < BasePresenter

  def collect(collections)
    collections.collect { |collection| self.new(collection) }
  end

end