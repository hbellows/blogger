Rails.application.routes.draw do
  # get '/articles', to: 'articles#index'
  # root to: 'articles#index'
  resources :articles
end
