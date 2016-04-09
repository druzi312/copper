Rails.application.routes.draw do
  get 'sessions/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'music'   => 'static_pages#music'
  get 'video'   => 'static_pages#video'
  get 'signup'  => 'users#new'

  #get 'sample-artwork'  => 'paintings/2'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get    'paintings/order'   => 'paintings#order'
  resources :paintings

  get    'say-hello'   => 'contacts#new'
  resources :contacts

  resources :tags
  resources :users
  resources :account_activations, only: [:edit]

end