# frozen_string_literal: true

class PlacesAutocompleteService
  HOST ||= 'https://xegr-geography.herokuapp.com/places/autocomplete'
  attr_accessor :term

  def initialize(term)
    @term = term
  end

  def call
    Rails.cache.fetch([HOST, term], expires: 1.hour) do
      JSON.parse(request, symbolized_keys: true)
    end
  end

  private

  def request
    HTTP.get(HOST, params: { input: term })
  end
end
