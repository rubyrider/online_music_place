json.array! @albums do |album|
  json.id album.to_param
  json.name album.title
  json.cover_url album.cover.url(:sm_medium)
  json.banner_url album.banner.url(:sm_medium)
  json.favorite album.favorite_by?(current_user)
  json.placeholder_image_url '//placeholdit.imgix.net/~text?txtsize=33&txt=album&w=300&h=300'
end