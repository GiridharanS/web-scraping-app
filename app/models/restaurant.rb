# frozen_string_literal: true

class Restaurant < ApplicationRecord
  include Filterable
  # Associations
  belongs_to :location
  has_many :categories, dependent: :destroy

  # Scope Methodes
  scope :filter_by_location, ->(location_id) { where location_id: location_id }
  scope :filter_by_restaurant_type, ->(restaurant_type) { where restaurant_type: restaurant_type }
  scope :filter_by_starts_with, ->(name) { where('name ilike ?', "#{name}%") }
end
