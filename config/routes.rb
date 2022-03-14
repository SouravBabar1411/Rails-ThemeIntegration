Rails.application.routes.draw do
  root 'default#dashboard'

  #business routes for csv 
  resources :businesses do
    collection { post :import }
  end

  ## Business Routes
  resources :businesses
    get '/fetch_businesses', to: 'businesses#fetch_businesses'
end
