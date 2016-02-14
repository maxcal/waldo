Rails.application.routes.draw do
  root to: 'games#index'
  resources :highscores, only: [:index, :show, :create]
end
