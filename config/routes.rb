Rails.application.routes.draw do
  get 'dashboard/philosophers', to: 'philosophers#list_owned'
  # add routes for orders

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :philosophers, only: [:index, :new, :create, :show] do
    resources :reservations, only: [:new, :create]
  end
end
