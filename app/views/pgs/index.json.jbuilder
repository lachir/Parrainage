json.array!(@pgs) do |pg|
  json.extract! pg, :nom, :prenom, :bucque, :fam, :num, :saque, :bio, :boul_id, :prepa_id
  json.url pg_url(pg, format: :json)
end
