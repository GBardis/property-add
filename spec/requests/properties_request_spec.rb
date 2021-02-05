require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  describe 'CREATE property' do
    it 'responds to html by default' do
      post :create, params: { property: attributes_for(:property) }
      expect(response).to redirect_to(properties_path)
    end
  end

  describe 'UPDATE property' do
    before do
      @property = create(:property)
    end
    it 'responds responds with redirect' do
      patch :update, params: { id: @property.id, property: { title: 'new title', property_transaction: 'buy' } }
      expect(response).to redirect_to(properties_path)
    end
  end

  describe 'DELETE property' do
    before do
      @property = create(:property)
    end
    it 'responds with redirect' do
      delete :destroy, params: { id: @property.id }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'CREATE property failed' do
    it 'responds ' do
      property = attributes_for(:property).except(:title)
      post :create, params: { property: property }
      expect(response).to render_template(:new)
    end
  end

  describe 'UPDATE property failed' do
    before do
      @property = create(:property)
    end
    it 'responds responds with redirect' do
      patch :update, params: { id: @property.id, property: { price: 'asd' } }
      expect(response.status).to render_template(:edit)
    end
  end

  describe 'DELETE property failed' do
    before do
      @property = create(:property)
    end
    it 'responds with redirect' do
      delete :destroy, params: { id: 'asd' }
      expect(response.status).to render_template('layouts/404')
    end
  end
end
