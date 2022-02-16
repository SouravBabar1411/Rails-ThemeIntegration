Rails.application.routes.draw do
  #resources :comments
  get 'hashtags/new'
  get 'hashtags/create'
  resources :posts do
    resources :hashtags, module: :posts
  end
  resources :achievements
  #resources :posts
  resources :sports do
    resources :posts do
      resources :comments
    end
    resources :players
    resources :annoucements
  end
  devise_for :users
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end