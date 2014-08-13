json.array!(@bouls) do |boul|
  json.extract! boul, :nom
  json.url boul_url(boul, format: :json)
end
