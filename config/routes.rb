Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'sign_out', to: 'sessions#destroy', as: :signout

  resources :organizations do
    resources :projects, except: [:index]
    get :users, to: 'organization_users#index'
  end

  resources :locations, only: [:show, :edit, :update]

  resources :payments, only: [:create]
  post '/share', to: 'payments#share'
end
