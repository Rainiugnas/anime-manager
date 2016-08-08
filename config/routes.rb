Rails.application.routes.draw do
  resources :animes, except: [:show, :index] do
    collection do
      get "/to_check", to: 'animes#to_check'
      get "/to_see", to: 'animes#to_see'
      get "/saw", to: 'animes#saw'
    end
  end

  root to: 'animes#stats'

  #Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
