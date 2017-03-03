FeaturerWeb::Engine.routes.draw do
  root to: 'features#index'

  get '/login', to: 'sessions#show_login'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  resources :features
end
