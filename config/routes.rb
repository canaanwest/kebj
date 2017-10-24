Rails.application.routes.draw do
  root 'homepage#index'

  resources :reviews
  resources :loves
  get '/homepage', to:'homepage#index', as: 'homepage'

  #
  # get '/love', to: 'loves#index', as: 'loves'
  # get '/love/:id', to: 'loves#show', as: 'love'
  get '/resume', to: 'resume#index', as: 'resume'
end
