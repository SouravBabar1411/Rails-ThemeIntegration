Rails.application.routes.draw do
  root 'default#dashboard'

  ## Business Routes
  resources :businesses
    get '/fetch_businesses', to: 'businesses#fetch_businesses'

  resources :offers
end
