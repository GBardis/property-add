require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'Presence validation' do
    it 'is not valid without a title, property_type, property_transaction, area, price' do
      property = Property.new(title: nil, property_transaction: nil, property_type: nil, area: nil, price: nil)
      expect(property).to_not be_valid
    end

    it 'is valid with a title, property_type, property_transaction, area, price' do
      property = Property.new(title: 'ads', property_transaction: 'rent', property_type: 'house',
                              area: 'Galatsi,Ελλάδα', price: 21)

      expect(property).to be_valid
    end
  end

  describe 'Title validation' do
    it 'title length not valid' do
      property = Property.new(title: Faker::String.random(length: 156), property_transaction: 'rent', property_type: 'house',
                              area: 'Galatsi,Ελλάδα', price: 21)
      expect(property).to_not be_valid
    end

    it 'title length valid' do
      property = Property.new(title: Faker::String.random(length: 155), property_transaction: 'rent', property_type: 'house',
                              area: 'Galatsi,Ελλάδα', price: 21)

      expect(property).to be_valid
    end
  end

  describe 'Numericality validation for price, bathrooms, levels' do
    it 'Numericality not valid' do
      property = Property.new(title: 'test', property_transaction: 'rent', property_type: 'house',
                              area: 'Galatsi,Ελλάδα', price: 'test', bathrooms: 'test', levels: 'test')
      expect(property).to_not be_valid
    end

    it 'Numericality valid' do
      property = Property.new(title: 'test', property_transaction: 'rent', property_type: 'house',
                              area: 'Galatsi,Ελλάδα', price: 12, bathrooms: 1, levels: 1)
      expect(property).to be_valid
    end
  end

  describe 'Numericality validation only integer for bathrooms, levels' do
    it 'Numericality only integer not valid' do
      property = Property.new(title: 'test', property_transaction: 'rent', property_type: 'house',
                              area: 'Galatsi,Ελλάδα', price: 12, bathrooms: 1.2, levels: 1.2)
      expect(property).to_not be_valid
    end

    it 'Numericality only integer valid' do
      property = Property.new(title: 'test', property_transaction: 'rent', property_type: 'house',
                              area: 'Galatsi,Ελλάδα', price: 12, bathrooms: 1, levels: 1)
      expect(property).to be_valid
    end
  end

  describe 'Price value validation' do
    it 'Price value not valid' do
      property = Property.new(title: 'test', property_transaction: 'rent', property_type: 'house',
                              area: 'Galatsi,Ελλάδα', price: 12, bathrooms: 1, levels: 1)
      expect(property).to be_valid
    end

    it 'Price value valid' do
      property = Property.new(title: 'test', property_transaction: 'rent', property_type: 'house',
                              area: 'Galatsi,Ελλάδα', price: 12, bathrooms: 1, levels: 1)
      expect(property).to be_valid
    end
  end
end
