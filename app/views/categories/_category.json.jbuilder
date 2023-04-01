# frozen_string_literal: true

json.extract! category, :id, :name, :image_url, :description, :products, :created_at, :updated_at
json.url category_url(category, format: :json)
