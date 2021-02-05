FactoryBot.define do
  factory :property do
    title {Faker::Quote.singular_siegler }
    levels { Faker::Number.between(from: 1, to: 10) }
    bathrooms { Faker::Number.between(from: 1, to: 10) }
    property_transaction { 'rent' }
    property_type { 'house' }
    area { 'galasti, athens' }
    price { Faker::Number.between(from: 1000, to: 10000) }
    description { Faker::Quote.famous_last_words }
    place_id { Faker::String.random(length: 4) }
  end
end

