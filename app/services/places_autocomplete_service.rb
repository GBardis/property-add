# frozen_string_literal: true

class PlacesAutocompleteService
  HOST ||= 'https://xegr-geography.herokuapp.com/places/autocompl'
  attr_accessor :term

  def initialize(term)
    @term = term
  end

  def call
    Rails.cache.fetch([HOST, term], expires: 1.hour) do
      JSON.parse(response, symbolized_keys: true)
    end
  end

  private

  def request
    HTTP.get(HOST, params: { input: term })
  end

  def response
    response = request
    return '[]' if response.status.client_error? || response.status.server_error?

    response
  end
end
