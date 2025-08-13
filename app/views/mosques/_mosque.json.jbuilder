json.extract! mosque, :id, :status, :name, :description, :longitude, :latitude, :address, :capacity, :donations_count, :created_at, :updated_at
json.city mosque.translated_city
json.size mosque.translated_size
json.establish_year mosque.establish_year.year if mosque.establish_year.present?
json.cover_image mosque.cover_image.attached? ? rails_blob_url(mosque.cover_image) : nil
json.donations mosque.donations do |donation|
  json.extract! donation, :id, :title, :description, :is_verified, :current_amount, :target_amount, :created_at, :updated_at
end

json.url mosque_url(mosque, format: :json)
