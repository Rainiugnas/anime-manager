Rails.application.routes.draw do
  resources :animes, except: [:show, :index]

  root to: 'animes#stats'

  #Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
