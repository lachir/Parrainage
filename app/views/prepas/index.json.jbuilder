json.array!(@prepas) do |prepa|
  json.extract! prepa, :nom, :ville
  json.url prepa_url(prepa, format: :json)
end
