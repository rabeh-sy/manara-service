json.extract! mosque, :id, :status, :name, :description, :longitude, :latitude, :address, :capacity, :created_at, :updated_at
json.city mosque.translated_city
json.size mosque.translated_size
json.establish_year mosque.establish_year.year if mosque.establish_year.present?

json.url mosque_url(mosque, format: :json)
