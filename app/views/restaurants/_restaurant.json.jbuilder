# frozen_string_literal: true

json.extract! restaurant, :id, :name, :restaurant_type, :location_id, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
