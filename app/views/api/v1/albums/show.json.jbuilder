json.(@album, :id, :name)
json.songs @album.songs do |song|
  json.id song.id
  json.name song.name
  json.duration song.duration
  json.song_url song.audio.url
  json.artist_names song.artists.collect {|artist| artist.name}
end