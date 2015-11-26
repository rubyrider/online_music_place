json.(@play_list, :id, :name)
json.favorite @play_list.favorite_by?(current_user)
    json.songs @play_list.songs do |song|
json.id song.id
json.name song.name
json.duration song.duration
json.song_url song.audio.url
json.favorite song.favorite_by?(current_user)
    json.playlist song.belongs_to_playlist?
    json.artist_names song.artists.collect {|artist| artist.name}
end