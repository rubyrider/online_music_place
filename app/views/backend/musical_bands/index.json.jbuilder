json.array!(@musical_bands) do |musical_band|
  json.extract! musical_band, :id
  json.url musical_band_url(musical_band, format: :json)
end
