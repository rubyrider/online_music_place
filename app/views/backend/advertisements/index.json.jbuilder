json.array!(@backend_advertisements) do |backend_advertisement|
  json.extract! backend_advertisement, :id
  json.url backend_advertisement_url(backend_advertisement, format: :json)
end
