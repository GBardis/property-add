Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'properties#index'

  resources :properties do
    get :area_autocomplete, on: :collection
  end
end
