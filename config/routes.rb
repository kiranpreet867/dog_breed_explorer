Rails.application.routes.draw do
  root "breeds#index"

  get "about", to: "pages#about"

  resources :breeds, only: [ :index, :show ]
end
