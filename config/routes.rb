Rails.application.routes.draw do
  get '/', to: 'yourtuber#index'

  resources :yourtuber, only: [:index, :new, :show]
end
