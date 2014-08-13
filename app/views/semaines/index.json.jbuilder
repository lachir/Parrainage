json.array!(@semaines) do |semaine|
  json.extract! semaine, :nom, :description, :startdate, :enddate
  json.url semaine_url(semaine, format: :json)
end
