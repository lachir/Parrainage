json.array!(@sondages) do |sondage|
  json.extract! sondage, :nom, :description, :nbchoix, :startdate, :enddate
  json.url sondage_url(sondage, format: :json)
end
