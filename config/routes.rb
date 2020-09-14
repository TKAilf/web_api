Rails.application.routes.draw do
  get '/', to: 'yourtuber#index'
  post '/yourtuber/searches', to: 'yourtuber#search'
  resources :yourtuber, only: [:index, :new]
end
