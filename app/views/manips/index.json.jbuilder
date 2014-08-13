json.array!(@manips) do |manip|
  json.extract! manip, :nom, :lieu
  json.url manip_url(manip, format: :json)
end
