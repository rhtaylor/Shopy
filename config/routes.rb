Rails.application.routes.draw do 
  root 'barbers#shop'  
  get 'login', to: 'customers#login'
  get 'logout', to: 'application#logout' 
  post 'login_user', to: 'customers#login_user' 
  get '/auth/facebook/callback' => 'customers#fbook'
  resources :haircuts
  resources :appointments
  resources :customers do 
    resources :haircuts, only: [:new, :show ]
  end
  resources :barbers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
