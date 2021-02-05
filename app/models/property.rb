# frozen_string_literal: true

class Property < ApplicationRecord
  # Constants
  TRANSACTION ||= %w[rent buy exchange donation].freeze
  TYPES ||= %w[house business_space land parking].freeze
  # Enums
  enum property_type: { house: 0, business_space: 1, land: 2, parking: 3 }
  enum property_transaction: { rent: 0, buy: 1, exchange: 2, donation: 3 }
  # Validations
  validates :title, :property_type, :property_transaction, :area, :price, presence: true
  validates :title, allow_blank: false, length: { maximum: 155 }
  validates :price, numericality: true
  validates :bathrooms, numericality: { only_integer: true }
  validates :levels, numericality: { only_integer: true }
  validate :price_value

  private

  def price_value
    errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
  end
end
