# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Sad')
Category.create(name: 'Romance')
Category.create(name: 'Rock')
Category.create(name: 'Random')
Category.create(name: 'Pop')
Category.create(name: 'Metal')

ARTISTNAME = ['Habib', 'Ayub Bacchu', 'Shumon', 'James', 'Anila Naz', 'Adnan Sami']

30.times do |i|
  album = Album.new
  album.name = "Album #{i}"
  album.release_date = Date.today - rand(1..10).years
  if i%3 == 0
    album.new_release = true
  end
  album.save!
  AlbumCategory.create(category_id: Category.all.sample.id, album_id: album.id)
  20.times do |j|
    song  = Song.new
   song.album_id = album.id
    song.name = "Song #{j}"
    song.artist_name = ARTISTNAME.sample
    song.save!
  end
end