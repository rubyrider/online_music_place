class AlbumPresenter < BasePresenter

  def as_json(options = nil)
    {
        id:           self.object.id,
        name:         self.object.title,
        release_date: self.object.release_date
    }
  end

end