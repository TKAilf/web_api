Rails.application.routes.draw do
  get '/',                   to: 'yourtuber#index'
  get '/yourtuber/results', to: 'yourtuber#result'
  resources :yourtuber,      only: [:index]
end
