json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :name, :parish, :age_range, :price, :attr_url, :description, :map_url, :user_id
  json.url attraction_url(attraction, format: :json)
end
