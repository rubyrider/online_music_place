class GenerateSlugs < ActiveRecord::Migration
  def change
    Artist.find_each(&:save)
    PlayList.find_each(&:save)
    Album.find_each(&:save)
    Song.find_each(&:save)
  end
end
