json.array! @songs do |song|
  json.id song.id
  json.title song.name
  json.artist song.artists.collect {|artist| artist.name}.first
  json.mp3 song.audio.url
end