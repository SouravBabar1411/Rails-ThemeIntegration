Rails.application.routes.draw do
  root 'default#dashboard'
  ## Business Routes
  resources :businesses do
    collection do
      get '/fetch_businesses', to: 'businesses#fetch_businesses'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
