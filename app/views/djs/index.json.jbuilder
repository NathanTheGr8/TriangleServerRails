json.array!(@djs) do |dj|
  json.extract! dj, :id, :name, :location, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
  json.url dj_url(dj, format: :json)
end
