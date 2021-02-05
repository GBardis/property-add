require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:properties)
  # end

  test 'Create new Property' do
    post properties_url, property: { title: 'test', levels: 0, bathrooms: 0, property_transaction: 'rent',
                              property_type: 'house', area: 'galatsi, athens', price: '10',
                              description: 'test', place_id: 'test' }
    assert_response :successGFE
  end
end
