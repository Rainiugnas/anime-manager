Rails.application.routes.draw do
  resources :animes, except: [:show, :index]

  root to: 'animes#stats'
end
