Rails.application.routes.draw do
  get '/',                   to: 'yourtuber#index'
  get '/yourtuber/searches', to: 'yourtuber#search'
  resources :yourtuber,      only: [:index]
end
