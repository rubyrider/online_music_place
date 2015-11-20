json.array! @albums do |album|
  json.id album.id
  json.name album.title
  json.cover album.cover
  json.banner album.banner
  json.placeholder_image_url '//placeholdit.imgix.net/~text?txtsize=33&txt=album&w=300&h=300'
end