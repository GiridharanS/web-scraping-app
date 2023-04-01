# frozen_string_literal: true

class Category < ApplicationRecord
  include Filterable

  belongs_to :restaurant
  has_many :products, dependent: :destroy

  # Scope Methodes
  scope :filter_by_restaurant, ->(restaurant_id) { where restaurant_id: restaurant_id }
end
