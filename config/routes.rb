Rails.application.routes.draw do
  get 'sessions/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'

  #get 'sample-artwork'  => 'paintings/2'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get    'paintings/order'   => 'paintings#order'
  resources :paintings

  resources :tags
  resources :users
  resources :account_activations, only: [:edit]

end