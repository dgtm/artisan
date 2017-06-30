json.extract! artist, :id, :name, :description, :latitude, :longitude, :image_url, :created_at, :updated_at
json.url artist_url(artist, format: :json)
