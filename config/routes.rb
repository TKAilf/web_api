Rails.application.routes.draw do
  get '/', to: 'youtube_test#index'

  resources :yourtuber, only: [:show]
end
