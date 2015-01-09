json.array!(@actives) do |active|
  json.extract! active, :id, :first, :middle, :last, :phone, :email, :year, :major, :pledgeclass, :inhouse
  json.url active_url(active, format: :json)
end
