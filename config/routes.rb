Rails.application.routes.draw do
  get '/',                   to: 'yourtuber#index'
  post '/yourtuber/results', to: 'yourtuber#result'
  resources :yourtuber,      only: [:index]
end
