Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'pictures#index'
  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
