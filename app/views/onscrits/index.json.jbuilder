json.array!(@onscrits) do |onscrit|
  json.extract! onscrit, :nom, :prenom, :naissance, :prepa_id
  json.url onscrit_url(onscrit, format: :json)
end
